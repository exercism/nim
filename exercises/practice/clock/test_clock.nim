import unittest
import clock

func `==`(c: Clock, s: string): bool =
  $c == s

suite "Create a new clock with an initial time":
  test "on the hour":
    check initClock(8, 0) == "08:00"

  test "past the hour":
    check initClock(11, 9) == "11:09"

  test "midnight is zero hours":
    check initClock(24, 0) == "00:00"

  test "hour rolls over":
    check initClock(25, 0) == "01:00"

  test "hour rolls over continuously":
    check initClock(100, 0) == "04:00"

  test "sixty minutes is next hour":
    check initClock(1, 60) == "02:00"

  test "minutes roll over":
    check initClock(0, 160) == "02:40"

  test "minutes roll over continuously":
    check initClock(0, 1723) == "04:43"

  test "hour and minutes roll over":
    check initClock(25, 160) == "03:40"

  test "hour and minutes roll over continuously":
    check initClock(201, 3001) == "11:01"

  test "hour and minutes roll over to exactly midnight":
    check initClock(72, 8640) == "00:00"

  test "negative hour":
    check initClock(-1, 15) == "23:15"

  test "negative hour rolls over":
    check initClock(-25, 0) == "23:00"

  test "negative hour rolls over continuously":
    check initClock(-91, 0) == "05:00"

  test "negative minutes":
    check initClock(1, -40) == "00:20"

  test "negative minutes roll over":
    check initClock(1, -160) == "22:20"

  test "negative minutes roll over continuously":
    check initClock(1, -4820) == "16:40"

  test "negative sixty minutes is previous hour":
    check initClock(2, -60) == "01:00"

  test "negative hour and minutes both roll over":
    check initClock(-25, -160) == "20:20"

  test "negative hour and minutes both roll over continuously":
    check initClock(-121, -5810) == "22:10"


suite "Add minutes":
  test "add minutes":
    check initClock(10, 0) + 3.Minutes == "10:03"

  test "add no minutes":
    check initClock(6, 41) + 0.Minutes == "06:41"

  test "add to next hour":
    check initClock(0, 45) + 40.Minutes == "01:25"

  test "add more than one hour":
    check initClock(10, 0) + 61.Minutes == "11:01"

  test "add more than two hours with carry":
    check initClock(0, 45) + 160.Minutes == "03:25"

  test "add across midnight":
    check initClock(23, 59) + 2.Minutes == "00:01"

  test "add more than one day (1500 min = 25 hrs)":
    check initClock(5, 32) + 1500.Minutes == "06:32"

  test "add more than two days":
    check initClock(1, 1) + 3500.Minutes == "11:21"


suite "Subtract minutes":
  test "subtract minutes":
    check initClock(10, 3) - 3.Minutes == "10:00"

  test "subtract to previous hour":
    check initClock(10, 3) - 30.Minutes == "09:33"

  test "subtract more than an hour":
    check initClock(10, 3) - 70.Minutes == "08:53"

  test "subtract across midnight":
    check initClock(0, 3) - 4.Minutes == "23:59"

  test "subtract more than two hours":
    check initClock(0, 0) - 160.Minutes == "21:20"

  test "subtract more than two hours with borrow":
    check initClock(6, 15) - 160.Minutes == "03:35"

  test "subtract more than one day (1500 min = 25 hrs)":
    check initClock(5, 32) - 1500.Minutes == "04:32"

  test "subtract more than two days":
    check initClock(2, 20) - 3000.Minutes == "00:20"


suite "Compare two clocks for equality":
  test "clocks with same time":
    check initClock(15, 37) == initClock(15, 37)

  test "clocks a minute apart":
    check initClock(15, 36) != initClock(15, 37)

  test "clocks an hour apart":
    check initClock(14, 37) != initClock(15, 37)

  test "clocks with hour overflow":
    check initClock(10, 37) == initClock(34, 37)

  test "clocks with hour overflow by several days":
    check initClock(3, 11) == initClock(99, 11)

  test "clocks with negative hour":
    check initClock(22, 40) == initClock(-2, 40)

  test "clocks with negative hour that wraps":
    check initClock(17, 3) == initClock(-31, 3)

  test "clocks with negative hour that wraps multiple times":
    check initClock(13, 49) == initClock(-83, 49)

  test "clocks with minute overflow":
    check initClock(0, 1) == initClock(0, 1441)

  test "clocks with minute overflow by several days":
    check initClock(2, 2) == initClock(2, 4322)

  test "clocks with negative minute":
    check initClock(2, 40) == initClock(3, -20)

  test "clocks with negative minute that wraps":
    check initClock(4, 10) == initClock(5, -1490)

  test "clocks with negative minute that wraps multiple times":
    check initClock(6, 15) == initClock(6, -4305)

  test "clocks with negative hours and minutes":
    check initClock(7, 32) == initClock(-12, -268)

  test "clocks with negative hours and minutes that wrap":
    check initClock(18, 7) == initClock(-54, -11513)

  test "full clock and zeroed clock":
    check initClock(24, 0) == initClock(0, 0)
