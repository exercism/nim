import std/[strutils, tables]

func transform*(t: Table[int, seq[char]]): CountTable[char] =
  result = initCountTable[char]()
  for score, letters in t:
    for c in letters:
      result[c.toLowerAscii] = score
