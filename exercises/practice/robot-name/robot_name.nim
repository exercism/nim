type
  Name* = array[5, char]
  Robot* = object
    name*: Name

proc makeRobot*: Robot =
  discard

proc reset*(r: var Robot) =
  discard
