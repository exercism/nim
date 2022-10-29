import std/[math, strformat]

# `euclMod` was added to `std/math` in Nim 1.6.0.
# Define `euclMod` ourselves when we are compiling with an earlier Nim version.
when not compiles(euclMod(3, 2)):
  func euclMod*[T: SomeNumber](x, y: T): T =
    ## Returns euclidean modulo of `x` by `y` (returning a non-negative number).
    result = x mod y
    if result < 0:
      result += abs(y)

type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

func initClock*(hour, minute: int): Clock =
  const minutesInHour = 60
  let numMinutes = (hour * minutesInHour + minute).euclMod(minutesInHour * 24)
  Clock(hour: numMinutes div minutesInHour, minute: numMinutes mod minutesInHour)

func `$`*(c: Clock): string =
  &"{c.hour:02}:{c.minute:02}"

func `+`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute + v.int)

func `-`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute - v.int)
