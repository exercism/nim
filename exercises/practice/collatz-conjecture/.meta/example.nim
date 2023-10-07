func steps*(n: int): int =
  if n < 1:
    raise newException(ValueError, "Not a positive integer: " & $n)

  var n = n
  result = 0
  while n != 1:
    n = if n mod 2 == 0: n div 2 else: 3 * n + 1
    inc result
