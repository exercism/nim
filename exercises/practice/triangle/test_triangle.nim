import
  std / unittest

import
  triangle

suite "equilateral triangle":
  test "all sides are equal":
    check equilateral(@[2, 2, 2]) == true
  test "any side is unequal":
    check equilateral(@[2, 3, 2]) == false
  test "no sides are equal":
    check equilateral(@[5, 4, 6]) == false
  test "all zero sides is not a triangle":
    check equilateral(@[0, 0, 0]) == false
  test "sides may be floats":
    check equilateral(@[0.5'f64, 0.5'f64, 0.5'f64]) == true
suite "isosceles triangle":
  test "last two sides are equal":
    check isosceles(@[3, 4, 4]) == true
  test "first two sides are equal":
    check isosceles(@[4, 4, 3]) == true
  test "first and last sides are equal":
    check isosceles(@[4, 3, 4]) == true
  test "equilateral triangles are also isosceles":
    check isosceles(@[4, 4, 4]) == true
  test "no sides are equal":
    check isosceles(@[2, 3, 4]) == false
  test "first triangle inequality violation":
    check isosceles(@[1, 1, 3]) == false
  test "second triangle inequality violation":
    check isosceles(@[1, 3, 1]) == false
  test "third triangle inequality violation":
    check isosceles(@[3, 1, 1]) == false
  test "sides may be floats":
    check isosceles(@[0.5'f64, 0.4'f64, 0.5'f64]) == true
suite "scalene triangle":
  test "no sides are equal":
    check scalene(@[5, 4, 6]) == true
  test "all sides are equal":
    check scalene(@[4, 4, 4]) == false
  test "two sides are equal":
    check scalene(@[4, 4, 3]) == false
  test "may not violate triangle inequality":
    check scalene(@[7, 3, 2]) == false
  test "sides may be floats":
    check scalene(@[0.5'f64, 0.4'f64, 0.6'f64]) == true
