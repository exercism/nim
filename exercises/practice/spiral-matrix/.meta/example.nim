func spiral*(n: static int): array[n, array[n, int]] =
  var walkLen = n
  var count = 1
  var p = (x: -1, y: 0) # Start outside the top left corner.
  while walkLen > 0:
    # Define x to increase rightwards, and y to increase downwards.
    # Walk in the order: right, down, left, up.
    for (x, y) in [(1, 0), (0, 1), (-1, 0), (0, -1)]:
      for _ in 1..walkLen:
        p.x += x
        p.y += y
        result[p.y][p.x] = count
        inc count
      # Subtract 1 from the walk length after finishing a horizontal walk.
      if y == 0:
        dec walkLen
