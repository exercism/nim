import unittest
import pascals_triangle

suite "Pascal's Triangle":
  test "zero rows":
    check pascal(0).len == 0

  test "single row":
    check pascal(1) == @[
      @[1]
    ]

  test "two rows":
    check pascal(2) == @[
      @[1],
      @[1, 1]
    ]

  test "three rows":
    check pascal(3) == @[
      @[1],
      @[1, 1],
      @[1, 2, 1]
    ]

  test "four rows":
    check pascal(4) == @[
      @[1],
      @[1, 1],
      @[1, 2, 1],
      @[1, 3, 3, 1]
    ]

  test "five rows":
    check pascal(5) == @[
      @[1],
      @[1, 1],
      @[1, 2, 1],
      @[1, 3, 3, 1],
      @[1, 4, 6, 4, 1]
    ]

  test "six rows":
    check pascal(6) == @[
      @[1],
      @[1, 1],
      @[1, 2, 1],
      @[1, 3, 3, 1],
      @[1, 4, 6, 4, 1],
      @[1, 5, 10, 10, 5, 1]
    ]

  test "ten rows":
    check pascal(10) == @[
      @[1],
      @[1, 1],
      @[1, 2, 1],
      @[1, 3, 3, 1],
      @[1, 4, 6, 4, 1],
      @[1, 5, 10, 10, 5, 1],
      @[1, 6, 15, 20, 15, 6, 1],
      @[1, 7, 21, 35, 35, 21, 7, 1],
      @[1, 8, 28, 56, 70, 56, 28, 8, 1],
      @[1, 9, 36, 84, 126, 126, 84, 36, 9, 1]
    ]
