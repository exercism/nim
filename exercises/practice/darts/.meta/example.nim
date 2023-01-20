import std/math

func score*(x, y: float): int =
  let r = hypot(x, y)
  if r <= 1:
    10
  elif r <= 5:
    5
  elif r <= 10:
    1
  else:
    0
