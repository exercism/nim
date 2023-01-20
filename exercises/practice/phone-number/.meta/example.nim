func clean*(s: string): string =
  for c in s:
    if c in {'0'..'9'}:
      result.add c

  if result.len == 11 and result[0] == '1':
    result = result[1 .. ^1]

  if result.len != 10 or result[0] in {'0', '1'} or result[3] in {'0', '1'}:
    raise newException(ValueError, "Invalid phone number: " & s)
