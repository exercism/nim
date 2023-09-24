import std/algorithm

func toBase10(digits: openArray[int], fromBase: int): int =
  result = 0
  var power = 1
  for i in countdown(digits.high, 0):
    let d = digits[i]
    result += d * power
    power *= fromBase

func fromBase10(n: int, toBase: int): seq[int] =
  if n == 0:
    return @[0]
  result = newSeq[int]()
  var n = n
  while n > 0:
    result.add n mod toBase
    n = n div toBase
  result.reverse

func convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase < 2:
    raise newException(ValueError, "Invalid input base: " & $fromBase)
  elif toBase < 2:
    raise newException(ValueError, "Invalid output base: " & $toBase)
  else:
    for d in digits:
      if d >= fromBase or d < 0:
        raise newException(ValueError, "Invalid input digit: " & $d)
  digits.toBase10(fromBase).fromBase10(toBase)
