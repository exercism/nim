import times

proc add_gigasecond*(date: DateTime): DateTime =
    date + initInterval(seconds=1_000_000_000)