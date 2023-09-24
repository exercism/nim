func score*(x, y: float): int =
  if x > 10 or y > 10: # Avoid overflow when squaring large x or y.
    0
  else:
    let rSquared = x*x + y*y
    if rSquared <= 1:
      10
    elif rSquared <= 25:
      5
    elif rSquared <= 100:
      1
    else:
      0
