type
  Compass* = enum
    North, East, South, West

  Robot* = object
    direction*: Compass
    xPos*: int
    yPos*: int

# constructor proc to return a new robot with default attributes
proc initRobot*(facing = North, x = 0, y = 0): Robot =
  discard

# implement this proc to move the robot following the instructions
proc move*(robot: var Robot, instructions: string) =
  discard
