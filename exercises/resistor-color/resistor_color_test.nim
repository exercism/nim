import unittest
import resistor_color

suite "Resistor Color":
  test "black":
    check colorCode(Black) == 0

  test "white":
    check colorCode(White) == 9

  test "orange":
    check colorCode(Orange) == 3

  test "all resistor colors":
    check colors() == [Black, Brown, Red, Orange, Yellow,
                       Green, Blue, Violet, Grey, White]
