import unittest
import collatz_conjecture

suite "Collatz Conjecture":
  test "zero steps for one":
    check steps(1) == 0

  test "divide if even":
    check steps(16) == 4

  test "even and odd steps":
    check steps(12) == 9

  test "large number of even and odd steps":
    check steps(1_000_000) == 152

  test "zero is an error":
    expect(ValueError):
      discard steps(0)

  test "negative value is an error":
    expect(ValueError):
      discard steps(-15)
