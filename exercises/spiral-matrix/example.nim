type Point = tuple[x, y: int]

func `+=`(a: var Point, b: Point) =
  a = (a.x + b.x, a.y + b.y)

# Define x to increase rightwards, and y to increase downwards.
const directions: array[4, Point] = [(1, 0), (0, 1), (-1, 0), (0, -1)]

func spiral*(n: static int): array[n, array[n, int]] =
  var walkLen = n
  var count = 1
  var p: Point = (-1, 0)  # Start outside the top left corner.

  while walkLen > 0:
    for d in directions:  # Walk in the order: right, down, left, up.
      for _ in 1..walkLen:
        p += d
        result[p.y][p.x] = count
        inc count

      # Subtract 1 from the walk length after finishing a horizontal walk.
      if d.y == 0:
        dec walkLen
