import std/math

type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White
  Resistor = array[3, ResistorColor]

func ohms(a: Resistor): int =
  (10 * a[0].ord + a[1].ord) * 10^(a[2].ord)

func label*(a: Resistor): tuple[value: int, unit: string] =
  result.value = ohms(a)
  const units = ["ohms", "kiloohms", "megaohms", "gigaohms"]

  for i in 0 .. units.high:
    if result.value >= 1000:
      result.value = result.value div 1000
    else:
      result.unit = units[i]
      return
