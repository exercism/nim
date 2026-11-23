import std/algorithm

func convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase < 2:
    raise newException(ValueError, "Invalid input base: " & $fromBase)
  if toBase < 2:
    raise newException(ValueError, "Invalid output base: " & $toBase)

  # Convert to base 10.
  var n = 0
  for d in digits:
    if d < fromBase and d >= 0:
      n = n * fromBase + d
    else:
      raise newException(ValueError, "Invalid input digit: " & $d)

  # Convert base 10 to digits in the output base.
  if n == 0:
    return @[0]
  result = @[]
  while n > 0:
    result.add n mod toBase
    n = n div toBase
  result.reverse
