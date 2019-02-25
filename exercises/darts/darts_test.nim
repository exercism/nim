import unittest
import darts

# version 1.1.0

suite "Darts":
  test "A dart lands outside the target":
    check score((-9.0, 9.0)) == 0

  test "A dart lands just in the border of the target":
    check score((0.0, 10.0)) == 1

  test "A dart lands in the outer circle":
    check score((4.0, 4.0)) == 1

  test "A dart lands right in the border between outer and middle circles":
    check score((5.0, 0.0)) == 5

  test "A dart lands in the middle circle":
    check score((0.8, -0.8)) == 5

  test "A dart lands right in the border between middle and inner circles":
    check score((0.0, -1.0)) == 10

  test "A dart lands in the inner circle":
    check score((-0.1, -0.1)) == 10
