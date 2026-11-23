func distance*(a, b: string): int =
  result = 0
  if a.len == b.len:
    for i in 0 .. a.high:
      if a[i] != b[i]:
        inc result
  else:
    raise newException(ValueError, "the inputs must be of equal length")
