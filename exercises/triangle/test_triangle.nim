import unittest
import triangle

suite "Equilateral triangle":
  test "all sides are equal":
    check isEquilateral([2, 2, 2]) == true

  test "any side is unequal":
    check isEquilateral([2, 3, 2]) == false

  test "no sides are equal":
    check isEquilateral([5, 4, 6]) == false

  test "all zero sides is not a triangle":
    check isEquilateral([0, 0, 0]) == false


suite "Isosceles triangle":
  test "last two sides are equal":
    check isIsosceles([3, 4, 4]) == true

  test "first two sides are equal":
    check isIsosceles([4, 4, 3]) == true

  test "first and last sides are equal":
    check isIsosceles([4, 3, 4]) == true

  test "equilateral triangles are also isosceles":
    check isIsosceles([4, 4, 4]) == true

  test "no sides are equal":
    check isIsosceles([2, 3, 4]) == false

  test "first triangle inequality violation":
    check isIsosceles([1, 1, 3]) == false

  test "second triangle inequality violation":
    check isIsosceles([1, 3, 1]) == false

  test "third triangle inequality violation":
    check isIsosceles([3, 1, 1]) == false


suite "Scalene triangle":
  test "no sides are equal":
    check isScalene([5, 4, 6]) == true

  test "all sides are equal":
    check isScalene([4, 4, 4]) == false

  test "two sides are equal":
    check isScalene([4, 4, 3]) == false

  test "may not violate triangle inequality":
    check isScalene([7, 3, 2]) == false
