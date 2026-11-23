type
  Compass* = enum
    North, East, South, West

  Robot* = object
    direction*: Compass
    x*: int
    y*: int

func initRobot*(facing = North, x = 0, y = 0): Robot =
  Robot(direction: facing, x: x, y: y)

func move*(robot: var Robot, instructions: string) =
  for c in instructions:
    case c
    of 'L':
      robot.direction =
          if robot.direction == Compass.low: Compass.high else: pred(robot.direction)
    of 'R':
      robot.direction =
          if robot.direction == Compass.high: Compass.low else: succ(robot.direction)
    of 'A':
      case robot.direction:
        of North: inc robot.y
        of South: dec robot.y
        of East: inc robot.x
        of West: dec robot.x
    else:
      discard
