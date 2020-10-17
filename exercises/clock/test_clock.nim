import unittest
import clock

suite "Create a new clock with an initial time":
  test "on the hour":
    check create((8, 0)).toStr == "08:00"

  test "past the hour":
    check create((11, 9)).toStr == "11:09"

  test "midnight is zero hours":
    check create((24, 0)).toStr == "00:00"

  test "hour rolls over":
    check create((25, 0)).toStr == "01:00"

  test "hour rolls over continuously":
    check create((100, 0)).toStr == "04:00"

  test "sixty minutes is next hour":
    check create((1, 60)).toStr == "02:00"

  test "minutes roll over":
    check create((0, 160)).toStr == "02:40"

  test "minutes roll over continuously":
    check create((0, 1723)).toStr == "04:43"

  test "hour and minutes roll over":
    check create((25, 160)).toStr == "03:40"

  test "hour and minutes roll over continuously":
    check create((201, 3001)).toStr == "11:01"

  test "hour and minutes roll over to exactly midnight":
    check create((72, 8640)).toStr == "00:00"

  test "negative hour":
    check create((-1, 15)).toStr == "23:15"

  test "negative hour rolls over":
    check create((-25, 0)).toStr == "23:00"

  test "negative hour rolls over continuously":
    check create((-91, 0)).toStr == "05:00"

  test "negative minutes":
    check create((1, -40)).toStr == "00:20"

  test "negative minutes roll over":
    check create((1, -160)).toStr == "22:20"

  test "negative minutes roll over continuously":
    check create((1, -4820)).toStr == "16:40"

  test "negative sixty minutes is previous hour":
    check create((2, -60)).toStr == "01:00"

  test "negative hour and minutes both roll over":
    check create((-25, -160)).toStr == "20:20"

  test "negative hour and minutes both roll over continuously":
    check create((-121, -5810)).toStr == "22:10"


suite "Add minutes":
  test "add minutes":
    check add((10, 0), 3).toStr == "10:03"

  test "add no minutes":
    check add((6, 41), 0).toStr == "06:41"

  test "add to next hour":
    check add((0, 45), 40).toStr == "01:25"

  test "add more than one hour":
    check add((10, 0), 61).toStr == "11:01"

  test "add more than two hours with carry":
    check add((0, 45), 160).toStr == "03:25"

  test "add across midnight":
    check add((23, 59), 2).toStr == "00:01"

  test "add more than one day (1500 min = 25 hrs)":
    check add((5, 32), 1500).toStr == "06:32"

  test "add more than two days":
    check add((1, 1), 3500).toStr == "11:21"


suite "Subtract minutes":
  test "subtract minutes":
    check subtract((10, 3), 3).toStr == "10:00"

  test "subtract to previous hour":
    check subtract((10, 3), 30).toStr == "09:33"

  test "subtract more than an hour":
    check subtract((10, 3), 70).toStr == "08:53"

  test "subtract across midnight":
    check subtract((0, 3), 4).toStr == "23:59"

  test "subtract more than two hours":
    check subtract((0, 0), 160).toStr == "21:20"

  test "subtract more than two hours with borrow":
    check subtract((6, 15), 160).toStr == "03:35"

  test "subtract more than one day (1500 min = 25 hrs)":
    check subtract((5, 32), 1500).toStr == "04:32"

  test "subtract more than two days":
    check subtract((2, 20), 3000).toStr == "00:20"


suite "Compare two clocks for equality":
  test "clocks with same time":
    check create((15, 37)) == create((15, 37))

  test "clocks a minute apart":
    check create((15, 36)) != create((15, 37))

  test "clocks an hour apart":
    check create((14, 37)) != create((15, 37))

  test "clocks with hour overflow":
    check create((10, 37)) == create((34, 37))

  test "clocks with hour overflow by several days":
    check create((3, 11)) == create((99, 11))

  test "clocks with negative hour":
    check create((22, 40)) == create((-2, 40))

  test "clocks with negative hour that wraps":
    check create((17, 3)) == create((-31, 3))

  test "clocks with negative hour that wraps multiple times":
    check create((13, 49)) == create((-83, 49))

  test "clocks with minute overflow":
    check create((0, 1)) == create((0, 1441))

  test "clocks with minute overflow by several days":
    check create((2, 2)) == create((2, 4322))

  test "clocks with negative minute":
    check create((2, 40)) == create((3, -20))

  test "clocks with negative minute that wraps":
    check create((4, 10)) == create((5, -1490))

  test "clocks with negative minute that wraps multiple times":
    check create((6, 15)) == create((6, -4305))

  test "clocks with negative hours and minutes":
    check create((7, 32)) == create((-12, -268))

  test "clocks with negative hours and minutes that wrap":
    check create((18, 7)) == create((-54, -11513))

  test "full clock and zeroed clock":
    check create((24, 0)) == create((0, 0))
