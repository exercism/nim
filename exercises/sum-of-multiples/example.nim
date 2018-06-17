import sequtils

proc sum*(limit: int, factors: seq[int]): int =
  for num in 0..<limit:
    if anyIt(factors, num mod it == 0):
      result = result + num