import unittest
import difference_of_squares

test "square of sum, 5":
  check square_of_sum(5) == 225

test "sum of squares, 5":
  check sum_of_squares(5) == 55

test "difference, 5":
  check difference(5) == 170

test "square of sum, 100":
  check square_of_sum(100) == 25502500

test "sum of squares, 100":
  check sum_of_squares(100) == 338350

test "difference, 100":
  check difference(100) == 25164150
