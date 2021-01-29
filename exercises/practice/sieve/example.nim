import math

func eratosthenes(n: int): seq[bool] =
  result = newSeq[bool](n+1)
  result[2] = true

  for odd in countup(3, n, 2):
    result[odd] = true

  for i in countup(3, n.float.sqrt.int, 2): # Optimisation: stop at sqrt(n)
    if result[i]:
      for j in countup(i*i, n, 2*i): # Optimisation: start at i*i
        result[j] = false

let p = eratosthenes(1e6.int)

proc primes*(limit: int): seq[int] =
  for i in 2 .. limit:
    if p[i]:
      result &= i
