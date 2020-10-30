import unittest
import darts

suite "Darts":
  test "missed target":
    check score((-9.0, 9.0)) == 0

  test "on the outer circle":
    check score((0.0, 10.0)) == 1

  test "on the middle circle":
    check score((-5.0, 0.0)) == 5

  test "on the inner circle":
    check score((0.0, -1.0)) == 10

  test "exactly on centre":
    check score((0.0, 0.0)) == 10

  test "near the centre":
    check score((-0.1, -0.1)) == 10

  test "just within the inner circle":
    check score((0.7, 0.7)) == 10

  test "just outside the inner circle":
    check score((0.8, -0.8)) == 5

  test "just within the middle circle":
    check score((-3.5, 3.5)) == 5

  test "just outside the middle circle":
    check score((-3.6, -3.6)) == 1

  test "just within the outer circle":
    check score((-7.0, 7.0)) == 1

  test "just outside the outer circle":
    check score((7.1, -7.1)) == 0

  test "asymmetric position between the inner and middle circles":
    check score((0.5, -4.0)) == 5
