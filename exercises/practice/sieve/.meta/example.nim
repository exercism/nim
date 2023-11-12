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

func primes*(limit: int, sieveLimit: static int = 1000): seq[int] =
  ## Returns every prime number up to `limit`.
  ## Caller guarantees that `limit` is less than or equal to `sieveLimit`.
  const sieve = eratosthenes(sieveLimit)
  result = @[]
  for i in 2 .. limit:
    if sieve[i]:
      result.add i
