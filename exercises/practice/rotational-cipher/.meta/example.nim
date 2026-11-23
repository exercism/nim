const alphabetLen = len('a'..'z')

func rotate(c: char, n: 0..alphabetLen, isLower: static bool): char =
  const last = when isLower: 'z'.ord else: 'Z'.ord
  var rotated = c.ord + n
  if rotated > last:
    rotated -= alphabetLen
  char(rotated)

func rotate*(s: string, n: 0..alphabetLen): string =
  result = newString(s.len)
  for i, c in s:
    if c in {'a'..'z'}:
      result[i] = rotate(c, n, true)
    elif c in {'A'..'Z'}:
      result[i] = rotate(c, n, false)
    else:
      result[i] = c
