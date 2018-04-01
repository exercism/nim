import
  critbits, strutils

type TWordCount* = CritBitTree[int]
  ## A mapping from strings (`words`) to ints (`counts`).

iterator words(s: string): string =
  for word in s.split(AllChars - Letters - Digits - {'\0'}):
    yield toLowerAscii(word)

proc wordCount*(s: string): TWordCount {.noSideEffect.} =
  ## Returns a mapping from the words (alphanumeric sequences) in `s` to their
  ## respective counts.
  for word in words(s):
    if word.len == 0:
      continue
    if not result.hasKey(word):
      result[word] = 0
    result[word] = result[word] + 1
