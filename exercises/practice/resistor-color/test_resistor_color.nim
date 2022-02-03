import
  std / unittest

import
  resistor_color

suite "Color codes":
  test "Black":
    check colorCode("black") == 0
  test "White":
    check colorCode("white") == 9
  test "Orange":
    check colorCode("orange") == 3
  test "Colors":
    check colors() ==
        @["black", "brown", "red", "orange", "yellow", "green", "blue",
          "violet", "grey", "white"]
