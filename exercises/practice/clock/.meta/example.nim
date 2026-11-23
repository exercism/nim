import std/[math, strformat]

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
