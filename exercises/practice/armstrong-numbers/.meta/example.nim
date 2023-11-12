import std/math

func countDigits(n: Natural): int =
  ## Returns the number of digits in `n`.
  ## Avoids expensive operations like `div`, `log10`, and string conversion.
  ## Optimized for small `n`, without binary search.
  result = 19 # int64.high is approximately 9.2 x 10^18, which has 19 digits.
  var t = 1
  for i in 1 ..< result:
    t *= 10
    if n < t:
      return i

iterator digits(n: Natural): int =
  ## Yields the digits of `n`.
  var n = n
  while n > 0:
    yield n mod 10
    n = n div 10

func isArmstrongNumber*(n: Natural): bool =
  let numDigits = countDigits(n)
  var sum = 0
  for d in digits(n):
    sum += d^numDigits
  sum == n
