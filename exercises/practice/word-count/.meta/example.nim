import std/[strutils, tables]

func countWords*(s: string): CountTable[string] =
  result = initCountTable[string]()
  var word = ""
  for i, c in s:
    if c in {'0'..'9', 'A'..'Z', 'a'..'z'}:
      word.add c.toLowerAscii()
    elif c == '\'' and word.len > 0 and i+1 < s.len and s[i+1] in {'A'..'Z', 'a'..'z'}:
      word.add c
    elif word.len > 0:
      result.inc word
      word.setLen 0
  if word.len > 0:
    result.inc word
