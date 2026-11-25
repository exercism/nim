type Item* = object
  weight*: int
  value*: int

proc maximumValue*(maximumWeight: int, items: openArray[Item]): int =
  discard
