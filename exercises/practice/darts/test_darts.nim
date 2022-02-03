import
  std / unittest

import
  darts

suite "darts tests":
  test "Missed target":
    check score(-9, 9) == 0
  test "On the outer circle":
    check score(0, 10) == 1
  test "On the middle circle":
    check score(-5, 0) == 5
  test "On the inner circle":
    check score(0, -1) == 10
  test "Exactly on centre":
    check score(0, 0) == 10
  test "Near the centre":
    check score(-0.1'f64, -0.1'f64) == 10
  test "Just within the inner circle":
    check score(0.7'f64, 0.7'f64) == 10
  test "Just outside the inner circle":
    check score(0.8'f64, -0.8'f64) == 5
  test "Just within the middle circle":
    check score(-3.5'f64, 3.5'f64) == 5
  test "Just outside the middle circle":
    check score(-3.6'f64, -3.6'f64) == 1
  test "Just within the outer circle":
    check score(-7.0'f64, 7.0'f64) == 1
  test "Just outside the outer circle":
    check score(7.1'f64, -7.1'f64) == 0
  test "Asymmetric position between the inner and middle circles":
    check score(0.5'f64, -4) == 5
