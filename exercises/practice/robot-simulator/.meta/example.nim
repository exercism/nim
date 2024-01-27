type
  Compass* = enum
    North, East, South, West

  Robot* = object
    direction*: Compass
    x*: int
    y*: int

func initRobot*(facing = North, x = 0, y = 0): Robot =
  Robot(direction: facing, x: x, y: y)

func left(dir: Compass): Compass =
  if dir == Compass.low: Compass.high else: pred(dir)

func right(dir: Compass): Compass =
  if dir == Compass.high: Compass.low else: succ(dir)

func move*(robot: var Robot, instructions: string) =
  for c in instructions:
    case c
    of 'L':
      robot.direction = robot.direction.left()
    of 'R':
      robot.direction = robot.direction.right()
    of 'A':
      case robot.direction:
        of North: inc robot.y
        of South: dec robot.y
        of East: inc robot.x
        of West: dec robot.x
    else:
      discard
