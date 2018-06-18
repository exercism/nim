import unittest

import triangle

suite "returns true if the triangle is equilateral":

  test "true if all sides are equal":
    check isEquilateral([2, 2, 2]) == true

  test "false if any side is unequal":
    check isEquilateral([2, 3, 2]) == false

  test "false if no sides are equal":
    check isEquilateral([5, 4, 6]) == false

  test "false if all sides are zero":
    check isEquilateral([0, 0, 0]) == false


suite "returns true if the triangle is isosceles":

  test "true if last two sides are equal":
    check isIsosceles([3, 4, 4]) == true

  test "true if first two sides are equal":
    check isIsosceles([4, 4, 3]) == true

  test "true if first and last sides are equal":
    check isIsosceles([4, 3, 4]) == true

  test "is equilateral triangles are also is isosceles":
    check isIsosceles([4, 4, 4]) == true

  test "false if no sides are equal":
    check isIsosceles([2, 3, 4]) == false

  test "violation of triangle inequality not is isosceles":
    check isIsosceles([1, 1, 3]) == false


suite "returns true if the triangle is scalene":

  test "true if no sides are equal":
    check isScalene([5, 4, 6]) == true

  test "false if all sides are equal":
    check isScalene([4, 4, 4]) == false

  test "false if two sides are equal":
    check isScalene([4, 4, 3]) == false

  test "violation of triangle inequality not is scalene":
    check isScalene([7, 3, 2]) == false
