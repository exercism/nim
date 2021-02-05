import unittest
import series

suite "Series":
  test "slices of one from one":
    check slices("1", 1) == @["1"]

  test "slices of one from two":
    check slices("12", 1) == @["1", "2"]

  test "slices of two":
    check slices("35", 2) == @["35"]

  test "slices of two overlap":
    check slices("9142", 2) == @["91", "14", "42"]

  test "slices can include duplicates":
    check slices("777777", 3) == @["777", "777", "777", "777"]

  test "slices of a long series":
    check slices("918493904243", 5) == @["91849", "18493", "84939", "49390",
                                         "93904", "39042", "90424", "04243"]

  test "slice length is too large":
    expect ValueError:
      discard slices("12345", 6)

  test "slice length cannot be zero":
    expect ValueError:
      discard slices("12345", 0)

  test "slice length cannot be negative":
    expect ValueError:
      discard slices("123", -1)

  test "empty series is invalid":
    expect ValueError:
      discard slices("", 1)
