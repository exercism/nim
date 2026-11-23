import std/tables

func countDna*(s: string): CountTable[char] =
  result = initCountTable[char](4)
  for c in s:
    if c in {'A', 'C', 'G', 'T'}:
      result.inc c
    else:
      raise newException(ValueError, "Not a valid nucleotide: " & c)
