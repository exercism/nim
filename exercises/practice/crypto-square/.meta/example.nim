import std/math

func normalized(s: string): string =
  result = newStringOfCap(s.len)
  for c in s:
    if c in {'a'..'z', '0'..'9'}:
      result.add c
    elif c in {'A'..'Z'}:
      result.add char(c.ord + 'a'.ord - 'A'.ord) # Converts to lowercase.

func encrypt*(s: string): string =
  result = ""
  var norm = normalized(s)
  if norm.len == 0:
    return

  let c = norm.len.float.sqrt.ceil.int
  let r = if c * (c-1) < norm.len: c else: c-1

  for _ in norm.len ..< c*r:
    norm.add ' '

  result = newStringOfCap(norm.len + c)

  for i in 0 ..< c:
    if result.len > 0:
      result.add ' '
    for j in countup(i, norm.high, c):
      result.add norm[j]
