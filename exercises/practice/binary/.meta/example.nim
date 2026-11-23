func binary*(s: string): int =
  result = 0
  for i, c in s:
    if c in {'0', '1'}:
      result = result shl 1 or (c.ord - '0'.ord)
    else:
      raise newException(ValueError, "not a binary number: " & s)
