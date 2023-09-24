import std/strutils

func abbreviate*(s: string): string =
  result = ""
  var isAfterDelim = true
  for c in s:
    if isAfterDelim and c in {'A'..'Z', 'a'..'z'}:
      result.add c.toUpperAscii()
      isAfterDelim = false
    elif c in {' ', '-'}:
      isAfterDelim = true
