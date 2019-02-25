func createLookup: array[10, int] =
  for i in 0 .. result.high:
    let d = 2 * i
    result[i] = if d > 9: d - 9 else: d

const lookup = createLookup() # Create lookup at compile-time.

func isValid*(s: string): bool =
  var toDouble = false
  var sum = 0
  var nDigits = 0

  for i in countdown(s.high, 0):
    if s[i] in {'0'..'9'}:
      let digit = s[i].ord - '0'.ord
      sum += (if toDouble: lookup[digit] else: digit)
      nDigits += 1
      toDouble = not toDouble
    elif s[i] == ' ':
      discard
    else:
      return false

  sum mod 10 == 0 and nDigits > 1
