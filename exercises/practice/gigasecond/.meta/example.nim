import std/times

proc addGigasecond*(date: DateTime): DateTime =
  date + initTimeInterval(seconds = 1_000_000_000)
