import unittest
import resistor_color_duo

# version 2.0.0

suite "Resistor Color Duo":
  test "brown and black":
    check value([Brown, Black]) == 10

  test "blue and grey":
    check value([Blue, Grey]) == 68

  test "yellow and violet":
    check value([Yellow, Violet]) == 47

  test "orange and orange":
    check value([Orange, Orange]) == 33
