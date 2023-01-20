import algorithm, math

func convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase < 2:
    raise newException(ValueError, "Invalid input base: " & $fromBase)
  if toBase < 2:
    raise newException(ValueError, "Invalid output base: " & $toBase)
  for d in digits:
    if d >= fromBase or d < 0:
      raise newException(ValueError, "Invalid input digit: " & $d)

  # Convert to base 10
  var n: int
  for i, d in digits:
    n += d * fromBase^(digits.high - i)

  # Convert base 10 to digits in the output base
  if n == 0:
    return @[0]
  while n > 0:
    result.add n mod toBase
    n = n div toBase
  result.reverse
