import std/times

type
  Schedule* = enum
    Teenth, First, Second, Third, Fourth, Last

proc meetup*(year: int, month: int, schedule: Schedule, day: WeekDay): string =
  discard
