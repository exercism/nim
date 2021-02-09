type Comparison* = enum
  Unequal, Sublist, Superlist, Equal

func contains(a, b: openArray[int]): bool =
  if len(b) == 0:
    return true
  elif len(b) > len(a):
    return false

  for i in 0 .. (a.high - b.high):
    var foundDifference = false
    if a[i] != b[0]:
      continue
    for j in 0 .. b.high:
      if a[i + j] != b[j]:
        foundDifference = true
        break
    if not foundDifference:
      return true

func sublist*(a, b: openArray[int]): Comparison =
  if a == b:
    Equal
  elif a.contains(b):
    Superlist
  elif b.contains(a):
    Sublist
  else:
    Unequal
