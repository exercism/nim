import std/[strformat, times]

type Schedule* = enum
  Teenth, First, Second, Third, Fourth, Last
const startDay: array[Schedule, int] = [13, 1, 8, 15, 22, 1]

proc meetup*(y: int, m: int, sched: Schedule, d: WeekDay): string =
  var dt = parse(&"{y}-{m}-{startDay[sched]}-12", "yyyy-M-d-hh", utc())

  if sched == Last:
    dt = dt + 1.months - 7.days

  dt = dt + ((d.ord - dt.weekday.ord + 7) mod 7).days
  result = dt.format("yyyy-MM-dd")
