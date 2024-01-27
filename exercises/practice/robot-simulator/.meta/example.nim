type
  Compass* = enum
    North, East, South, West

  Robot* = object
    direction*: Compass
    xPos*: int
    yPos*: int

proc initRobot*(facing: Compass = North, x: int = 0, y: int = 0): Robot =
  Robot(direction: facing, xPos: x, yPos: y)

proc right(dir: Compass): Compass =
  case dir:
    of North: East
    of East: South
    of South: West
    of West: North

proc left(dir: Compass): Compass =
  case dir:
    of North: West
    of East: North
    of South: East
    of West: South

proc move*(robot: var Robot, instructions: string) =
  for c in instructions:
    if c == 'L':
      robot.direction = robot.direction.left
    if c == 'R':
      robot.direction = robot.direction.right
    if c != 'A':
      continue
    case robot.direction:
      of North: inc(robot.yPos)
      of South: dec(robot.yPos)
      of East: inc(robot.xPos)
      of West: dec(robot.xPos)
