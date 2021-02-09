func slices*(s: string, n: int): seq[string] =
  if n > s.len or n < 1:
    raise newException(ValueError, "Invalid slice length: " & $n)

  for i in 0 .. s.len-n:
    result &= s[i ..< i+n]
