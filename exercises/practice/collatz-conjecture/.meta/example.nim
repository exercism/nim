func steps*(n: int): int =
  if n < 1:
    raise newException(ValueError, "Not a positive integer: " & $n)

  var n = n
  result = 0
  while n != 1:
    if n mod 2 == 0:
      n = n div 2
    else:
      n = (3 * n + 1) div 2
      inc result
    inc result
