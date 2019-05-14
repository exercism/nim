## This file is for testing the Nim track of exercism.io.
##
## It checks that the example solution for every implemented exercise passes
## that exercise's test suite.
##
##
## Usage
## =====
## Test all the exercises:
## - `nim c -r check_exercises.nim`
##
## Test a selection of exercises:
## - `nim c -r check_exercises.nim [exercise-name] [...]`
##
##
## Implementation
## ==============
## Running this file will:
## 1) Copy tests and examples from the standardized Exercism directory structure
##    into an output directory with a valid Nimble structure.
##
## 2) Write the following files:
##    - `all_tests.nim` (imports every test).
##    - `config.nims`   (modifies the path for the tests).
##
## 3) Run `all_tests.nim`.
##
##
## Output directory structure
## ==========================
## ```
## check_exercises_tmp
## ├── src
## │   └── check_exercises
## │       ├── acronym.nim
## │       ...
## │       └── yacht.nim
## ├── tests
## │   ├── all_tests.nim
## │   ├── config.nims
## │   ├── test_acronym.nim
## │   ...
## │   └── test_yacht.nim
## ```

import critbits, os, osproc, parseopt, streams, strscans, strutils, terminal

proc writeHelp =
  echo """Usage:
  check_exercises [options] [exercise-name]...

Check that the example solution for every implemented exercise passes that
exercise's test suite.

If any exercise names are given as arguments, test only those exercises.
Exercise names can be abbreviated, but must uniquely identify an exercise.

Options:
  -h, --help      Print this help message
  -q, --quiet     Only print test failures
  -r, --remove    Remove output directory at the end (if all tests pass)
  -t, --tmp       Set output path to a temporary location (e.g. in `/tmp`)"""
  quit(0)

let
  appDir = getAppDir()
  exercisesDir = appDir / "../exercises"
var
  outDir: string
  testDir: string
  srcDir: string
  allTestsPath: string

# Let us define the exercise names as a set of strings. This is simpler than
# defining an `enum` of all exercises (or all implemented exercises). We can use
# `CritBitTree[void]` - an efficient container for a sorted set of strings. It
# allows lookups by prefix so we can neatly support abbreviated exercise names
# as command-line arguments (e.g. "lar" for "largest-series-product").
type
  Slugs = CritBitTree[void]

proc getImplementedSlugs: Slugs =
  ## Returns the names of the implemented exercises.
  ##
  ## Let us consider an "implemented exercise" as one with a correctly named
  ## test file, rather than one with an entry in `config.json`. This can be more
  ## convenient when implementing new exercises.
  for _, dir in walkDir(exercisesDir):
    for file in walkFiles(dir / "tests" / "test_*.nim"):
      result.incl(dir.splitPath().tail) # e.g. "hello-world"

type
  Option = enum
    optQuiet, optRemove, optTmp
  Options = set[Option]

proc prepareDir(options: Options) =
  ## Creates the new directory structure for the tests.
  # Note that `getTempDir()` is generally discouraged, but it shouldn't cause
  # problems here and the `-t` option is not the default.
  let outBase = if optTmp in options: getTempDir() else: appDir
  outDir = outBase / "check_exercises_tmp"
  testDir = outDir / "tests"
  srcDir = outDir / "src" / "check_exercises"
  allTestsPath = testDir / "all_tests.nim"

  removeDir(outDir)
  createDir(testDir)
  createDir(srcDir)
  const configFileContents = "--path: \"$projectDir/../src/check_exercises\""
  writeFile(testDir / "config.nims", configFileContents)

proc wrapTest(file: string, slug: string): string =
  ## Returns the contents of `file`, but with the tests wrapped inside a proc.
  ##
  ## This is a workaround for the "too many global variables" error when running
  ## many top-level tests with `unittest`. It allows us to keep top-level
  ## `suite` statements in the repository's test files, which keeps them as
  ## clear as possible for the user.
  ##
  ## We need this workaround as the `suite` and `test` templates in `unittest`
  ## otherwise put every variable in the global scope, and Nim's GC sets a limit
  ## of 3500 global variables.
  var inSuite = false
  let origFile = readFile(file)
  let numSuites = origFile.count("\nsuite \"")
  # Allocate a longer string for the wrapped tests.
  result = newStringOfCap((origFile.len.float * 1.15).int)

  # Add one indentation layer to all lines from "suite" onwards.
  for line in lines(file):
    if line.len == 0:
      result &= "\n"
    elif line.startsWith("suite \""):
      # Put all the tests for an exercise into one suite.
      if not inSuite:
        inSuite = true
        result &= "proc main =\n"
        result &= "  suite \"" & slug & "\":\n"
      # If there are multiple suites, keep the suite names as comments only.
      if numSuites > 1:
        result &= "    # " & line[7 .. ^3] & "\n"
    # Enable bonus tests that are disabled by default.
    elif line.scanf("$sconst runBonusTest"): # Also support `runBonusTests`.
      let indent = if inSuite: "  " else: ""
      result &= indent & line.split('=')[0] & "= true\n"
    elif inSuite:
      result &= "  " & line & "\n"
    else:
      result &= line & "\n"
  result &= "\nmain()\n"
  # The below suppresses an "unused import" warning that is otherwise generated
  # for each exercise. We run each module's `main` proc when importing, but we
  # don't export any of its symbols.
  result &= "{.used.}\n"

proc prepareTests(slugs: Slugs) =
  ## Copies the example solution and a wrapped test file for the exercises in
  ## `slugs`, and writes a file that joins all the tests for these exercises.
  ##
  ## This allows us to compile `system.nim` and other dependencies only once,
  ## rather than per-exercise, which fixes the main performance bottleneck when
  ## testing multiple exercises. It also improves convenience by printing all
  ## compiler warnings and hints at the top of the output.
  var allTests = "import ../tests/[\n"

  for slug in slugs:
    let slugUnder = slug.replace("-", "_")
    let testName = "test_" & slugUnder # e.g. "test_hello_world"
    allTests &= "  " & testName & ",\n"
    let dir = exercisesDir / slug

    # Copy and rename the example solution. For example:
    #   `exercises/bob/example.nim`  ->  `outDir/src/check_exercises/bob.nim`
    copyFile(dir / "example.nim", srcDir / slugUnder & ".nim")

    # Copy a wrapped version of the test. For example:
    #   `exercises/bob/tests/test_bob.nim`  ->  `outDir/tests/test_bob.nim`
    let wrappedTest = wrapTest(dir / "tests" / "test_" & slugUnder & ".nim", slug)
    writeFile(testDir / testName & ".nim", wrappedTest)

  allTests &= "]\n"
  writeFile(allTestsPath, allTests)

proc quietRun: int =
  ## Runs the previously prepared tests, but only prints:
  ## - The more useful compiler output (minimum: any `CC` messages and a
  ##   `SuccessX` hint).
  ## - Failed tests.
  ## - The number of passing exercises.
  ## - The number of failing exercises and their names.
  ##
  ## Returns the exit code, which is `0` if all tests pass and `1` otherwise.
  result = -1

  putEnv("NIMTEST_OUTPUT_LVL", "PRINT_FAILURES")
  let args = @["c", "-r", "--styleCheck:hint", "--colors:on",
               "--hint[Conf]:off", "--hint[Processing]:off", "--hint[Link]:off",
               "--hint[SuccessX]:on", "--hint[Exec]:off", allTestsPath]

  const suiteStr = "[Suite] "
  const failedStr = "  [FAILED]"

  var
    p = startProcess("nim", args = args, options = {poStdErrToStdOut, poUsePath})
    outp = outputStream(p)
    line = newStringOfCap(200).TaintedString
    nextLine = newStringOfCap(200).TaintedString
    passed = newSeq[string]()
    failed = newSeq[string]()
  discard outp.readLine(nextLine)

  # The below prints the stream output, but edits it so that:
  # - For exercises where all tests pass: print nothing. This omits the lines
  #   `[Suite] slug\n\n` that `unittest` prints at any `NIMTEST_OUTPUT_LEVEL`.
  # - For exercises with at least one failing test: add the default `unittest`
  #   colors to the `[Suite] slug` line and the `[FAILED] test name` line(s).
  #   This is easier than editing the stream output with the `NIMTEST_COLOR`
  #   environomental variable set to `always`.

  while true:
    # The approach: to understand the current line we look at the one after it.
    # We have set `unittest` to only print failing tests, and so, for example,
    # if `[Suite] foo` is the final line or is followed by a blank line, then
    # all the tests for exercise `foo` have passed.
    # Note that `streams.peekLine` doesn't work for processes.
    line = nextLine
    if outp.readLine(nextLine):
      if line.len == 0:
        continue
      if line.startsWith(suiteStr):
        let slug = line[suiteStr.len .. ^1] # [Suite] is always followed by a slug.
        if nextLine.len == 0 or atEnd(outp):
          passed &= slug
        else:
          if failed.len > 0:
            stdout.write("\n")
          stdout.styledWrite(fgBlue, styleBright, suiteStr)
          stdout.writeLine(slug)
          failed &= slug
      elif line.startsWith(failedStr):
        let testDesc = line[failedStr.len .. ^1]
        stdout.styledWrite(fgRed, styleBright, failedStr)
        stdout.writeLine(testDesc)
      else:
        stdout.writeLine(line)
    else:
      # Handle the final line.
      if line.startsWith(suiteStr): # The final line when all suites pass.
        let slug = line[suiteStr.len .. ^1]
        passed &= slug
      else:
        stdout.writeLine(line)
      result = peekExitCode(p)
      if result != -1:
        break

  close(p)
  let maxLen = max(passed.len, failed.len)
  let numDigits = if maxLen < 10: 1 elif maxLen < 100: 2 else: 3
  if failed.len > 0:
    stdout.write("\n")
  echo "Passed: " & passed.len.`$`.align(numDigits)
  let failedSlugs = if failed.len == 0: "" else: " (" & failed.join(", ") & ")"
  echo "Failed: " & failed.len.`$`.align(numDigits) & failedSlugs

proc runTests(slugs: Slugs, options: Options): int =
  ## Runs the tests for the exercises in `slugs` with user-specifed `options`.
  ##
  ## Returns the exit code, which is `0` if all tests pass and `1` otherwise.
  prepareDir(options)
  prepareTests(slugs)

  if optQuiet in options:
    result = quietRun()
  else:
    result = execCmd("nim c -r --styleCheck:hint " & allTestsPath)
    if result == 0:
      let wording = if slugs.len == 1: " exercise." else: " exercises."
      echo "\nTested ", slugs.len, wording, "\nAll tests passed."
    else:
      echo "\nFailure. At least one test failed."

proc parseCmdLine: tuple[slugs: Slugs, options: Options] =
  ## Returns the user-specified exercise slugs and options.
  let implementedSlugs = getImplementedSlugs()

  for kind, key, val in getopt():
    let k = key.toLowerAscii().replace('_', '-') # Allow e.g. "two_fer"

    case kind
    of cmdShortOption, cmdLongOption:
      case k
      of "h", "help":
        writeHelp()
      of "q", "quiet":
        result.options.incl(optQuiet)
      of "r", "remove":
        # Removing the output directory at the end is opt-in. This simplifies
        # inspecting its contents.
        result.options.incl(optRemove)
      of "t", "tmp":
        # Setting the output directory to a temporary location is opt-in. This
        # keeps the output directory easy to find.
        result.options.incl(optTmp)
      else:
        stdout.styledWrite(fgRed, "Error: ")
        let prefix = if len(k) == 1: "-" else: "--"
        stdout.write("invalid command line option: '" & prefix & key & "'\n\n")
        writeHelp()
    of cmdArgument:
      if k in implementedSlugs:
        result.slugs.incl(k) # Test specified exercises in the order given.
      else:
        var matches = newSeq[string]()
        for match in implementedSlugs.keysWithPrefix(k):
          matches &= match
        case matches.len
        of 0:
          stdout.styledWrite(fgRed, "Error: ")
          stdout.write("unrecognized exercise name: '" & key & "'\n\n")
          writeHelp()
        of 1:
          result.slugs.incl(matches[0])
        else:
          stdout.styledWrite(fgRed, "Error: ")
          let wording = matches.join("\n  ")
          stdout.write("exercise name '" & key & "' is ambiguous. It matches:")
          stdout.write("\n  " & wording & "\n\n")
          writeHelp()
    of cmdEnd: assert(false) # Cannot happen.

  if result.slugs.len == 0:
    result.slugs = implementedSlugs # Test all exercises (in alphabetical order).

when isMainModule:
  let (slugs, options) = parseCmdLine()
  let exitCode = runTests(slugs, options)
  # Only respect the `--remove` option if all tests passed.
  if exitCode != 0:
    quit(exitCode)
  if optRemove in options:
    removeDir(outDir)
