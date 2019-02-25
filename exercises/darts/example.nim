import math

func score*(p: tuple[x, y: float]): int =
  let r = hypot(p.x, p.y)
  if r <= 1:
    10
  elif r <= 5:
    5
  elif r <= 10:
    1
  else:
    0
