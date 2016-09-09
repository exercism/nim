import math

type
  TriangleKind* = enum
    tkEquilateral,
    tkIsosceles,
    tkScalene

proc checkInvalidSide(f: float) =
  let fc = classify(f)
  if not (fc == fcNormal or fc == fcSubnormal) or f < 0:
    raise newException(ValueError, "invalid side: " & $f)

proc kind*(a, b, c: float): TriangleKind =
  checkInvalidSide(a)
  checkInvalidSide(b)
  checkInvalidSide(c)
  if a + b <= c or a + c <= b or b + c <= a:
    raise newException(ValueError, "one side is larger than the other two combined")
  elif a == b and b == c:
    return tkEquilateral
  elif a == b or b == c or a == c:
    return tkIsosceles
  else:
    return tkScalene
