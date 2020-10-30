import unittest
import difference_of_squares

suite "Difference of Squares":
  test "square of sum 1":
    check squareOfSum(1) == 1

  test "square of sum 5":
    check squareOfSum(5) == 225

  test "square of sum 100":
    check squareOfSum(100) == 25_502_500

  test "sum of squares 1":
    check sumOfSquares(1) == 1

  test "sum of squares 5":
    check sumOfSquares(5) == 55

  test "sum of squares 100":
    check sumOfSquares(100) == 338_350

  test "difference of squares 1":
    check difference(1) == 0

  test "difference of squares 5":
    check difference(5) == 170

  test "difference of squares 100":
    check difference(100) == 25_164_150
