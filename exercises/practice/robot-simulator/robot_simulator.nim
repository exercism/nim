type
  Compass* = enum
    North, East, South, West

  Robot* = object
    direction*: Compass
    x*: int
    y*: int

proc initRobot*(facing = North, x = 0, y = 0): Robot =
  discard

proc move*(robot: var Robot, instructions: string) =
  discard
