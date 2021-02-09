import math

proc isPrime(n: int): bool =
  if n <= 1:
    return false

  for i in 2 .. sqrt(n.toFloat).toInt:
    if n mod i == 0:
      return false

  return true

iterator primeIter(n: int): int =
  var
    candidate = 2
    countOfPrime = 0
  while countOfPrime < n:
    if candidate.isPrime:
      yield candidate
      inc countOfPrime
    inc candidate

proc prime*(number: int): int =
  if number < 1:
    raise newException(ValueError, "there is no zeroth prime")

  for i in primeIter(number):
    result = i
