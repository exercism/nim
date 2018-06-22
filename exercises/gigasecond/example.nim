import times

proc addGigasecond*(date: DateTime): DateTime =
  date + initInterval(seconds=1_000_000_000)