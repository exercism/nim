import std/math

func eratosthenes(n: int): seq[bool] =
  result = newSeq[bool](n+1)
  result[2] = true

  for odd in countup(3, n, 2):
    result[odd] = true

  for i in countup(3, n.float.sqrt.int, 2): # Optimization: stop at sqrt(n).
    if result[i]:
      for j in countup(i*i, n, 2*i): # Optimization: start at i*i.
        result[j] = false

func primesUpTo(limit: int): seq[int] =
  result = @[0]
  let p = eratosthenes(limit)
  for i, b in p:
    if b:
      result.add i

const limit = 1e6.int
let primes = primesUpTo(limit)

proc prime*(n: int): int =
  ## Returns the `n`th prime, or an exception if that is greater than `limit`.
  if n in 1..primes.high:
    primes[n]
  else:
    raise newException(ValueError, "n is out of range")
