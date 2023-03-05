type
  Comparison* = enum
    Unequal, Sublist, Superlist, Equal

proc sublist*(a, b: openArray[int]): Comparison =
  discard
