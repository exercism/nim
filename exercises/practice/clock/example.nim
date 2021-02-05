import strformat

type Clock = int
type Time = tuple[h, m: int]

func create*(t: Time): Clock =
  result = (t.h * 60 + t.m) mod 1440
  if result < 0:
    result += 1440

func toStr*(c: Clock): string =
  &"{c div 60:02}:{c mod 60:02}"

func add*(t: Time, v: int): int =
  create (t.h, t.m + v)

func subtract*(t: Time, v: int): int =
  create (t.h, t.m - v)
