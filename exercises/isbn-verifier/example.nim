func isValid*(s: string): bool =
  var digitCount = 0
  var sum = 0
  var n = 10

  for i, c in s:
    if c in {'0'..'9'}:
      sum += (c.ord - '0'.ord) * n
    elif c == 'X' and i == s.high:
      sum += 10 * n
    elif c == '-':
      continue
    else:
      return false
    dec n
    inc digitCount

  sum mod 11 == 0 and digitCount == 10
