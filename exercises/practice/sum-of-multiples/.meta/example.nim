import sequtils

func sum*(limit: int, factors: seq[int]): int =
  for num in 0..<limit:
    if factors.filterIt(it != 0).anyIt(num mod it == 0):
      result = result + num
