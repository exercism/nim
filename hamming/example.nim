import sequtils

proc isDifferent(pair: tuple[a, b: char]): bool = pair.a != pair.b

proc distance*(s1, s2: string): int =
  len(filter(zip(toSeq(s1.items), toSeq(s2.items)), isDifferent))
