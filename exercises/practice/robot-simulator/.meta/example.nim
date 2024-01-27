type
  Compass* = enum
    North, East, South, West

  Robot* = object
    direction*: Compass
    x*: int
    y*: int

func initRobot*(facing = North, x = 0, y = 0): Robot =
  Robot(direction: facing, x: x, y: y)

func right(dir: Compass): Compass =
  case dir:
    of North: East
    of East: South
    of South: West
    of West: North

func left(dir: Compass): Compass =
  case dir:
    of North: West
    of East: North
    of South: East
    of West: South

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
