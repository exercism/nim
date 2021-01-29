import sequtils

proc isDifferent(pair: tuple[a, b: char]): bool = pair.a != pair.b

proc distance*(strand1, strand2: string): int =
  if len(strand1) != len(strand2):
    raise newException(ValueError, "Invalid nucleotide")
  len(filter(zip(toSeq(strand1.items), toSeq(strand2.items)), isDifferent))
