import std/math

type Classification* = enum
  Perfect, Deficient, Abundant

func aliquotSum(n: int): int =
  let intSqrt = n.float.sqrt.int
  for x in 1 .. intSqrt:
    if n mod x == 0:
      result += x + n div x
  result -= n
  if intSqrt * intSqrt == n:
    result -= intSqrt

func classify*(n: int): Classification =
  if n <= 0:
    raise newException(ValueError, "Not a positive number: " & $n)
  let sum = aliquotSum(n)
  if sum == n: Perfect
  elif sum < n: Deficient
  else: Abundant
