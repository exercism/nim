import std/tables

func countDna*(s: string): CountTable[char] =
  result = s.toCountTable()

  for k in result.keys:
    if k notin {'A', 'C', 'G', 'T'}:
      raise newException(ValueError, "Not a valid nucleotide: " & k)
