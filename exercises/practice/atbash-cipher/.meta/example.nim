func atbash(c: char): char =
  const alphabet = "abcdefghijklmnopqrstuvwxyz"
  if c in {'A'..'Z'}:
    alphabet['Z'.ord - c.ord]
  elif c in {'a'..'z'}:
    alphabet['z'.ord - c.ord]
  else:
    c

func encode*(s: string, groupLen = 5): string =
  result = newStringOfCap(s.len + s.len div groupLen)
  var count = 0
  for c in s:
    if c in {'0'..'9', 'a'..'z', 'A'..'Z'}:
      if count == groupLen:
        result.add ' '
        count = 0
      result.add atbash(c)
      inc count

func decode*(s: string): string =
  result = newStringOfCap(s.len)
  for c in s:
    if c in {'0'..'9', 'a'..'z'}:
      result.add atbash(c)
