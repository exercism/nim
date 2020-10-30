import unittest
import nth_prime

suite "Nth Prime":
  test "first prime":
    check prime(1) == 2

  test "second prime":
    check prime(2) == 3

  test "sixth prime":
    check prime(6) == 13

  test "big prime":
    check prime(10_001) == 104_743

  test "there is no zeroth prime":
    expect(ValueError):
      discard prime(0)
