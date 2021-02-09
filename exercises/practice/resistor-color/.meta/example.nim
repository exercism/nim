type ResistorColor* = enum
  Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

func colorCode*(color: ResistorColor): int =
  color.ord

func colors*: array[0..ResistorColor.high.ord, ResistorColor] =
  for c in ResistorColor:
    result[c.ord] = c
