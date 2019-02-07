import unittest
import triangle

# version 1.2.0

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

  test "equilateral triangles are also isosceles":
    check isIsosceles([4, 4, 4]) == true

  test "false if no sides are equal":
    check isIsosceles([2, 3, 4]) == false

  test "false if sides violate triangle inequality, even if two are equal (1)":
    check isIsosceles([1, 1, 3]) == false

  test "false if sides violate triangle inequality, even if two are equal (2)":
    check isIsosceles([1, 3, 1]) == false

  test "false if sides violate triangle inequality, even if two are equal (3)":
    check isIsosceles([3, 1, 1]) == false


suite "returns true if the triangle is scalene":
  test "true if no sides are equal":
    check isScalene([5, 4, 6]) == true

  test "false if all sides are equal":
    check isScalene([4, 4, 4]) == false

  test "false if two sides are equal":
    check isScalene([4, 4, 3]) == false

  test "false if sides violate triangle inequality, even if they are all different":
    check isScalene([7, 3, 2]) == false
