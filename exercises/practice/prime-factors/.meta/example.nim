import std/math

func eratosthenes(n: int): seq[bool] =
  ## Returns a `seq` of length `n+1`.
  ## If `eratosthenes(n)[i] == true` then `i` is a prime number.
  result = newSeq[bool](n+1)
  result[2] = true

  for odd in countup(3, n, 2):
    result[odd] = true

  for i in countup(3, n.float.sqrt.int, 2):
    if result[i]:
      for j in countup(i*i, n, 2*i):
        result[j] = false

func primesFrom(sieve: openArray[bool]): seq[int] =
  ## Returns every prime number from `sieve` in ascending order.
  result = @[]
  for i, b in sieve:
    if b:
      result.add i

const limit = 1e6.int
let sieve = eratosthenes(limit)
let primes = primesFrom(sieve)

proc primeFactors*(n: int64): seq[int] =
  if n in 0..sieve.high and sieve[n]: # Skip factorization if we know `n` is prime.
    return @[n.int]

  var n = n
  var i = 0
  result = @[]

  while n > 1:
    let d = primes[i]
    while n mod d == 0:
      n = n div d
      result.add d
      if n < sieve.high and sieve[n]:
        result.add n.int
        return
    inc i
