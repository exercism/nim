import unittest
import resistor_color_duo

suite "Resistor Color Duo":
  test "brown and black":
    check value([Brown, Black]) == 10

  test "blue and grey":
    check value([Blue, Grey]) == 68

  test "yellow and violet":
    check value([Yellow, Violet]) == 47

  test "white and red":
    check value([White, Red]) == 92

  test "orange and orange":
    check value([Orange, Orange]) == 33

  test "ignore additional colors":
    check value([Green, Brown, Orange]) == 51

  test "black and brown, one-digit":
    check value([Black, Brown]) == 1
