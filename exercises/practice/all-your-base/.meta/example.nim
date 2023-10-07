import std/algorithm

func toBase10(digits: openArray[int], fromBase: int): int =
  result = 0
  for d in digits:
    result = result * fromBase + d

func fromBase10(n: int, toBase: int): seq[int] =
  if n == 0:
    return @[0]
  result = @[]
  var n = n
  while n > 0:
    result.add n mod toBase
    n = n div toBase
  result.reverse

func convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase < 2:
    raise newException(ValueError, "Invalid input base: " & $fromBase)
  if toBase < 2:
    raise newException(ValueError, "Invalid output base: " & $toBase)
  for d in digits:
    if d >= fromBase or d < 0:
      raise newException(ValueError, "Invalid input digit: " & $d)
  digits.toBase10(fromBase).fromBase10(toBase)
