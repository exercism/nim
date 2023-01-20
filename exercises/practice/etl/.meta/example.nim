import std/[strutils, tables]

func transform*(t: Table[int, seq[char]]): Table[char, int] =
  result = initTable[char, int]()

  for score, letters in t:
    for c in letters:
      result[c.toLowerAscii] = score
