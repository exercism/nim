import std/math

func normalized(s: string): string =
  result = newStringOfCap(s.len)
  for c in s:
    if c in {'a'..'z', '0'..'9'}:
      result.add c
    elif c in {'A'..'Z'}:
      result.add char(c.ord + 'a'.ord - 'A'.ord)

func encrypt*(s: string): string =
  result = ""
  var norm = normalized(s)
  if norm.len == 0:
    return

  let cols = norm.len.float.sqrt.ceil.int
  let rows = if cols * (cols - 1) < norm.len: cols else: cols - 1

  for _ in norm.len ..< cols * rows:
    norm.add ' '

  result = newStringOfCap(norm.len + cols)

  for i in 0 ..< cols:
    if result.len > 0:
      result.add ' '
    for j in countup(i, norm.high, cols):
      result.add norm[j]
