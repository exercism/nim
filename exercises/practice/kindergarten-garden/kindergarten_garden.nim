type
  Plant* = enum
    Clover, Grass, Radishes, Violets

proc plants*(garden: string, student: string): seq[Plant] =
  discard
