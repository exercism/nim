type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc label*(r: array[3, ResistorColor]): tuple[value: int, unit: string] =
  discard
