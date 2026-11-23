import std/strutils

func abbreviate*(s: string): string =
  result = ""
  for i in 0 ..< s.len:
    if s[i] in {'A'..'Z', 'a'..'z'}:
      if i == 0 or s[i-1] in {' ', '-', '_'}:
        result.add s[i].toUpperAscii()
