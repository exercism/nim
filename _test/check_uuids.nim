# Compile this file with `-d:ssl`. For an optimized build, use:
#     `nim c -d:ssl -d:release --passC:-flto --passL:-s check_uuids.nim`

## This file implements UUID checking using this approach:
## 1. Download an up-to-date list of all Exercism tracks.
## 2. Download the `config.json` file for each Exercism track.
## 3. Check that every UUID in the user-specified `config.json` file:
##    - is a valid version 4 UUID in the lowercase and hyphen-separated form
##    - is unique within the track
##    - does not exist on another Exercism track
##    - does not exist in the `exercism/problem-specifications` repo
##    The final two checks are skipped if `-o, --offline` is passed.
## 4. Quit with an exit code of:
##    - 1 if the above step found any problems.
##    - 0 otherwise.

import std/[algorithm, httpclient, json, os, osproc, parseopt, sets, strformat,
            strutils, terminal]

proc writeHelp =
  echo """Usage:
  check_uuids [options] <path/to/config.json>

Checks that every UUID in the specified Exercism track `config.json` file:
- is a valid version 4 UUID in the lowercase and hyphen-separated form
- is unique within the track
- does not exist on another Exercism track
- does not exist in the `exercism/problem-specifications` repo
The final two checks are skipped if `-o, --offline` is passed.

Otherwise, the program prints the bad UUID(s) and quits with a non-zero exit code.

Options:
  -h, --help        Show this help message and exit
  -o, --offline     Do not check that track UUIDs are unique across Exercism"""

proc writeError(msg: string) =
  stdout.styledWrite(fgRed, "Error: ")
  stdout.write(msg)
  stdout.write("\n")

proc writeWarning(msg: string) =
  stdout.styledWrite(fgYellow, "Warning: ")
  stdout.write(msg)
  stdout.write("\n")

type
  HelpMessage = object of CatchableError ## Raised when `-h, --help` is passed.
  UsageError = object of CatchableError ## Raised for invalid CLI options/arguments.
  UuidError = object of CatchableError ## Raised when there is an invalid UUID.
  DownloadError = object of CatchableError ## Raised if we couldn't download
                                           ## `problem-specifications` or other
                                           ## track `config.json` files properly.

proc writeHelpAndRaise =
  writeHelp()
  raise newException(HelpMessage, "")

proc writeErrorAndRaise[T](msg: string) =
  writeError(msg)
  when T is UsageError:
    writeHelp()
  raise newException(T, "")

proc getTrackNames: seq[string] =
  ## Returns the names of all current Exercism tracks (in alphabetical order).
  # This is better than hardcoding the names, because tracks are sometimes added
  # or renamed.
  const url = "https://api.github.com/search/repositories" &
              "?q=org:exercism+topic:exercism-track&per_page=100"
  let j = newHttpClient().getContent(url).parseJson()
  result = newSeqOfCap[string](100)
  for item in j["items"]:
    let name = item["name"].getStr()
    result.add name
  sort(result)

let
  downloadDir = getAppDir() / "check_uuids_track_configs"

proc downloadConfig(client: HttpClient, track: string) =
  ## Downloads the `config.json` file for the given Exercism track.
  let url = &"https://raw.githubusercontent.com/exercism/{track}/master/config.json"
  client.downloadFile(url, downloadDir / &"{track}.json")

proc downloadConfigs(tracks: seq[string]) =
  ## Downloads the `config.json` file for every Exercism track in `tracks`.
  discard existsOrCreateDir(downloadDir)
  # Let's keep this non-async for now.
  var client = newHttpClient()

  for i, track in tracks:
    echo &"Downloading {i+1}/{tracks.len}: {track}"
    downloadConfig(client, track)
    sleep(10)
  echo ""

proc otherTrackUuids(track: string): HashSet[string] =
  ## Returns a `HashSet` of every UUID on tracks other than `track`.
  result = initHashSet[string](8000)

  for f in walkFiles(downloadDir / "*.json"):
    let j = parseFile(f)
    if j["language"].getStr().toLowerAscii() != track:
      if j["exercises"].len > 0:
        for exercise in j["exercises"]:
          let uuid = exercise["uuid"].getStr()
          result.incl(uuid)
  echo &"{result.len:>4} distinct UUIDs on tracks other than 'exercism/{track}'.\n"

func isValidUuidV4(s: string): bool =
  ## Returns `true` if `s` is a valid version 4 UUID (compliant with RFC 4122)
  ## in the canonical textual representation.
  ##
  ## This func is equivalent to using `re.match` with the below regex pattern:
  ##
  ## `^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$`
  ##
  ## However, this func's implementation is faster and doesn't add a PCRE
  ## dependency.
  const
    Hex = {'0'..'9', 'a'..'f'}
    Separator = '-'
    Version = '4'
    Variant = {'8', '9', 'a', 'b'}
  result =
    s.len == 36 and
    s[0] in Hex and
    s[1] in Hex and
    s[2] in Hex and
    s[3] in Hex and
    s[4] in Hex and
    s[5] in Hex and
    s[6] in Hex and
    s[7] in Hex and
    s[8] == Separator and
    s[9] in Hex and
    s[10] in Hex and
    s[11] in Hex and
    s[12] in Hex and
    s[13] == Separator and
    s[14] == Version and
    s[15] in Hex and
    s[16] in Hex and
    s[17] in Hex and
    s[18] == Separator and
    s[19] in Variant and
    s[20] in Hex and
    s[21] in Hex and
    s[22] in Hex and
    s[23] == Separator and
    s[24] in Hex and
    s[25] in Hex and
    s[26] in Hex and
    s[27] in Hex and
    s[28] in Hex and
    s[29] in Hex and
    s[30] in Hex and
    s[31] in Hex and
    s[32] in Hex and
    s[33] in Hex and
    s[34] in Hex and
    s[35] in Hex

proc inclUuids(s: var HashSet[string], j: JsonNode) =
  ## Walks recursively over `j`, and adds the value of every `uuid` key to `s`.
  if j.kind == JObject:
    for k, v in j:
      if v.kind == JObject or v.kind == JArray:
        s.inclUuids(v)
      elif k == "uuid":
        let uuid = getStr(v)
        if s.containsOrIncl(uuid):
          writeWarning(&"duplicate UUID in problem-specifications: {uuid}")
        if not isValidUuidV4(uuid):
          writeWarning(&"invalid UUIDv4 in problem-specifications: {uuid}")
  elif j.kind == JArray:
    for item in j:
      s.inclUuids(item)

proc probSpecsUuids: HashSet[string] =
  ## Returns a `HashSet` of all UUIDs in `exercism/problem-specifications`.
  ##
  ## Raises `DownloadError` for errors related to cloning the
  ## `problem-specifications` repo.
  result = initHashSet[string](8000)

  let probSpecsDir = getAppDir() / "check_uuids_problem_specifications"

  if dirExists(probSpecsDir):
    writeErrorAndRaise[DownloadError](&"directory already exists: {probSpecsDir}")

  let cmd = "git clone --quiet --depth 1 " &
            &"https://github.com/exercism/problem-specifications.git {probSpecsDir}"
  try:
    echo "Cloning exercism/problem-specifications..."
    let errC = execCmd(cmd)
    if errC != 0:
      writeErrorAndRaise[DownloadError]("could not clone problem-specifications repo")

    for _, path in walkDir(probSpecsDir / "exercises"):
      let pathCD = path / "canonical-data.json"
      if fileExists(pathCD):
        let j = parseFile(pathCD)
        result.inclUuids(j)
  finally:
    removeDir(probSpecsDir)

  if result.len == 0:
    writeErrorAndRaise[DownloadError]("no UUIDs found in problem-specifications")
  echo &"{result.len:>4} distinct UUIDs in 'exercism/problem-specifications'.\n"

type
  Conf = object
    path: string  ## The path to the track `config.json` file.
    offline: bool ## Set to `true` to skip UUID checking Exercise-wide.

  Reason = enum
    rFormat = "UUID is not a valid version 4 UUID in the lowercase and " &
              "hyphen-separated form"
    rDupOnTrack = "UUID appears at least twice on the track"
    rDupOnAnotherTrack = "UUID exists on another Exercism track"
    rDupInProbSpecs = "UUID exists in 'exercism/problem-specifications'"

  BadUuid = tuple
    slug: string ## The exercise slug corresponding to the invalid UUID.
    uuid: string ## The invalid UUID itself.
    reason: Reason ## The reason that the UUID is invalid.

proc isEveryTrackUuidValid(conf: Conf, badUuids: var seq[BadUuid]): bool =
  ## Returns `true` if every UUID in the `config.json` file at `conf.path`:
  ## - is a valid version 4 UUID in the lowercase and hyphen-separated form
  ## - is unique within the track
  ## - does not exist on another Exercism track
  ## - does not exist in the `exercism/problem-specifications` repo
  ## The final two checks are skipped if `conf.offline` is `true`.
  ##
  ## Adds information about encountered bad UUIDs to `badUuids`.
  let j = parseFile(conf.path)
  let track = conf.path.parseFile()["language"].getStr().toLowerAscii()
  const emptySet = initHashSet[string](0)
  let otherTrackUuids = if conf.offline: emptySet else: otherTrackUuids(track)
  let probSpecsUuids = if conf.offline: emptySet else: probSpecsUuids()

  if not conf.offline and otherTrackUuids.len < 3000:
    writeErrorAndRaise[DownloadError]("too few UUIDs on other tracks: " &
                                      otherTrackUuids.len.`$`)

  var trackUuids = initHashSet[string](1000)
  result = true

  for exercise in j["exercises"]:
    let uuid = exercise["uuid"].getStr()
    let slug = exercise["slug"].getStr()
    if not isValidUuidV4(uuid):
      result = false
      badUuids.add (slug, uuid, rFormat)
    if trackUuids.containsOrIncl(uuid):
      result = false
      badUuids.add (slug, uuid, rDupOnTrack)
    if not conf.offline:
      if otherTrackUuids.contains(uuid):
        result = false
        badUuids.add (slug, uuid, rDupOnAnotherTrack)
      if probSpecsUuids.contains(uuid):
        result = false
        badUuids.add (slug, uuid, rDupInProbSpecs)

  let paddedNum = if conf.offline: trackUuids.len.`$` else: &"{trackUuids.len:>4}"
  echo &"{paddedNum} distinct UUIDs on the {track} track.\n"

  if result:
    echo "Success.\n" &
         &"Every UUID on the {track} track:\n" &
         "- is a valid version 4 UUID in the lowercase and hyphen-separated form\n" &
         "- is unique within the track"
    if not conf.offline:
      echo "- does not exist on another Exercism track\n" &
           "- does not exist in 'exercism/problem-specifications'"

proc display(badUuids: seq[BadUuid]) =
  ## Prints a table of the given `badUuids`.
  # First, find the longest string in each column (to set the column widths).
  var w = [-1, -1, -1] # Column widths.
  for (slug, uuid, reason) in badUuids:
    w[0] = max(w[0], slug.len)
    w[1] = max(w[1], uuid.len)
    w[2] = max(w[2], reason.`$`.len)

  # Print the header.
  echo &"""{alignLeft("Slug", w[0])}  {alignLeft("Invalid UUID", w[1])}  Reason"""
  echo &"{repeat('-', w[0])}  {repeat('-', w[1])}  {repeat('-', w[2])}"
  # Print the rows.
  for (slug, uuid, reason) in badUuids:
    echo &"{alignLeft(slug, w[0])}  {alignLeft(uuid, w[1])}  {reason}"
  echo ""

proc processCmdLine: Conf =
  ## Parses the command-line.
  ##
  ## Raises `HelpMessage` if the user asks for the help message.
  ## Raises `UsageError` for invalid options or arguments.
  result = Conf()

  for kind, key, val in getopt():
    let keyNormalized = key.toLowerAscii()

    case kind
    of cmdLongOption, cmdShortOption:
      case keyNormalized
      of "h", "help":
        # It's better to raise an exception than to use a deep `quit`.
        # See e.g. https://forum.nim-lang.org/t/4042
        writeHelpAndRaise()
      of "o", "offline":
        result.offline = true
      else:
        writeErrorAndRaise[UsageError](&"invalid option: '{key}'")
    of cmdArgument:
      case keyNormalized
      of "h", "help":
        writeHelpAndRaise()
      else:
        if fileExists(key):
          result.path = key
        else:
          writeErrorAndRaise[UsageError](&"specified file does not exist: '{key}'")
    of cmdEnd:
      discard

  const configFile = "config.json"
  if result.path.len == 0:
    if fileExists(configFile):
      result.path = configFile
    else:
      writeErrorAndRaise[UsageError](&"no file named '{configFile}' in the " &
                                      "current directory")

proc main =
  let conf = processCmdLine()
  if not conf.offline:
    let tracks = getTrackNames()
    downloadConfigs(tracks)
  var badUuids = newSeq[BadUuid]()
  if not isEveryTrackUuidValid(conf, badUuids):
    display(badUuids)
    writeErrorAndRaise[UuidError]("there was at least one invalid UUID.")

when isMainModule and not defined(test):
  try:
    main()
  except HelpMessage:
    discard
  except UsageError, DownloadError, UuidError:
    quit(1)


# Tests for the `isValidUuidV4` function are below.
when isMainModule and defined(test):
  import unittest

  const ValidUuidV4 = "01234567-9012-4567-9012-456789012345"
  doAssert ValidUuidV4.len == 36

  func uuidIndices: (seq[int], seq[int]) =
    for i, c in ValidUuidV4:
      if c == '-':
        result[0].add i
      else:
        result[1].add i

  const (HyphenIndices, HexIndices) = uuidIndices()

  suite "Valid version 4 UUIDs":
    test "digits only":
      check:
        isValidUuidV4(ValidUuidV4)

    test "only letters, apart from version number":
      const uuid = "abcdefab-abcd-4bcd-abcd-abcdefabcdef"
      check:
        isValidUuidV4(uuid)

    test "some valid version 4 UUIDs":
      const goodUuids = [
        "9a572704-80a0-4bf4-9aa6-97e4bf8133b4",
        "e6d19ba9-ba9c-4779-89d7-f6502c2a7e9c",
        "5d6af41f-45f8-4549-9a07-f496e39f1b53",
        "f9640d96-8794-49ab-8b27-9d2126ed8b5e",
        "07900fee-94d0-4c48-9969-ae4926f9842d",
        "aa023537-d021-4ee7-85ab-eae4a367ba62",
        "f21d1b67-3e10-4c29-9552-a881ef4401b8",
        "b6a419c1-0c51-46c2-91d5-707a847a46a9",
        "fe0bcef1-8f56-4a1e-a375-aeda6f8fb3bc",
        "418e92a8-ade5-4417-bc72-8e3709d1499c",
      ]
      for goodUuid in goodUuids:
        check:
          isValidUuidV4(goodUuid)

  suite "Invalid version 4 UUIDs":
    test "nil UUID":
      # The nil UUID is a valid UUID, but not a valid version 4 UUID.
      check:
        not isValidUuidV4("00000000-0000-0000-0000-000000000000")

    test "version 1 UUID":
      check:
        not isValidUuidV4("2ad51c8c-4a93-11eb-b378-0242ac130002")

    test "non-canonical form: without hyphens":
      check:
        not isValidUuidV4("01234567901245679012456789012345")

    test "non-canonical form: with uppercase":
      var uuid = ValidUuidV4
      for i in HexIndices:
        uuid[i] = "ABCDEF"[i mod 6]
        check:
          not isValidUuidV4(uuid)
        uuid[i] = ValidUuidV4[i]

    test "length: too short":
      check:
        not isValidUuidV4("")
        not isValidUuidV4(ValidUuidV4[0 .. ^2])

    test "length: too long":
      check:
        not isValidUuidV4(ValidUuidV4 & '6')
        not isValidUuidV4(ValidUuidV4 & ValidUuidV4)

    test "separators: each replaced by a hexadecimal digit":
      var uuid = ValidUuidV4
      for i in HyphenIndices:
        uuid[i] = char(i mod 10 + '0'.ord)
      check:
        not isValidUuidV4(uuid)

    test "separators: one replaced by a hexadecimal digit":
      var uuid = ValidUuidV4
      for i in HyphenIndices:
        uuid[i] = char(i mod 10 + '0'.ord)
        check:
          not isValidUuidV4(uuid)
        uuid[i] = '-'

    test "separators: one extra":
      var uuid = ValidUuidV4
      for i in HexIndices:
        uuid[i] = '-'
        check:
          not isValidUuidV4(uuid)
        uuid[i] = ValidUuidV4[i]

    test "separators: one in the wrong place":
      var uuid = ValidUuidV4
      for i in HyphenIndices:
        uuid[i] = char(i mod 10 + '0'.ord)
        for j in HexIndices:
          uuid[j] = '-'
          check:
            not isValidUuidV4(uuid)
          uuid[j] = ValidUuidV4[j]
        uuid[i] = '-'

    test "invalid character: letter that is not a hexadecimal digit":
      var uuid = ValidUuidV4
      for i in 0 .. uuid.high:
        uuid[i] = char(i mod 10 + 'g'.ord)
        check:
          not isValidUuidV4(uuid)
        uuid[i] = ValidUuidV4[i]

    const
      Hex = {'0'..'9', 'a'..'f'}

    test "character at the start of the third grouping":
      var uuid = ValidUuidV4
      for c in Hex:
        uuid[14] = c
        if c == '4':
          check isValidUuidV4(uuid)
        else:
          check not isValidUuidV4(uuid)

    test "character at the start of the fourth grouping":
      var uuid = ValidUuidV4
      for c in Hex:
        uuid[19] = c
        if c in {'8', '9', 'a', 'b'}:
          check isValidUuidV4(uuid)
        else:
          check not isValidUuidV4(uuid)
