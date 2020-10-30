import unittest
import resistor_color_trio

suite "Resistor Color Trio":
  test "orange and orange and black":
    check label([Orange, Orange, Black]) == (33, "ohms")

  test "blue and grey and brown":
    check label([Blue, Grey, Brown]) == (680, "ohms")

  test "red and black and red":
    check label([Red, Black, Red]) == (2, "kiloohms")

  test "green and brown and orange":
    check label([Green, Brown, Orange]) == (51, "kiloohms")

  test "yellow and violet and yellow":
    check label([Yellow, Violet, Yellow]) == (470, "kiloohms")
