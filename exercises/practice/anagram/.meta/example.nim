import std/strutils

func count(s: string): array[26, uint8] =
  for c in s:
    if c in {'a'..'z'}:
      inc result[c.ord - 'a'.ord]
    elif c in {'A'..'Z'}:
      inc result[c.ord - 'A'.ord]

func detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  result = @[]
  let targetCount = count(word)
  for cand in candidates:
    if targetCount == cand.count() and cmpIgnoreCase(word, cand) != 0:
      result.add cand
