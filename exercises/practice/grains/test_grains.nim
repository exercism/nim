import unittest
import grains

suite "Grains":
  test "grains on square 1":
    check onSquare(1) == 1

  test "grains on square 2":
    check onSquare(2) == 2

  test "grains on square 3":
    check onSquare(3) == 4

  test "grains on square 4":
    check onSquare(4) == 8

  test "grains on square 16":
    check onSquare(16) == 32_768

  test "grains on square 32":
    check onSquare(32) == 2_147_483_648'u64

  test "grains on square 64":
    check onSquare(64) == 9_223_372_036_854_775_808'u64

  test "square 0 raises an exception":
    expect(ValueError):
      discard onSquare(0)

  test "negative square raises an exception":
    expect(ValueError):
      discard onSquare(-1)

  test "square greater than 64 raises an exception":
    expect(ValueError):
      discard onSquare(65)

  test "returns the total number of grains on the board":
    check total() == 18_446_744_073_709_551_615'u64
