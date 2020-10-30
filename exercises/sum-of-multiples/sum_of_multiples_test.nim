import unittest
import sum_of_multiples

suite "Sum of Multiples":
  test "no multiples within limit":
    check sum(1, @[3, 5]) == 0

  test "one factor has multiples within limit":
    check sum(4, @[3, 5]) == 3

  test "more than one multiple within limit":
    check sum(7, @[3]) == 9

  test "more than one factor with multiples within limit":
    check sum(10, @[3, 5]) == 23

  test "each multiple is only counted once":
    check sum(100, @[3, 5]) == 2318

  test "a much larger limit":
    check sum(1000, @[3, 5]) == 233_168

  test "three factors":
    check sum(20, @[7, 13, 17]) == 51

  test "factors not relatively prime":
    check sum(15, @[4, 6]) == 30

  test "some pairs of factors relatively prime and some not":
    check sum(150, @[5, 6, 8]) == 4419

  test "one factor is a multiple of another":
    check sum(51, @[5, 25]) == 275

  test "much larger factors":
    check sum(10_000, @[43, 47]) == 2_203_160

  test "all numbers are multiples of 1":
    check sum(100, @[1]) == 4950

  test "no factors means an empty sum":
    check sum(10_000, @[]) == 0

  test "the only multiple of 0 is 0":
    check sum(1, @[0]) == 0

  test "the factor 0 does not affect the sum of multiples of other factors":
    check sum(4, @[3, 0]) == 3

  test "solutions using include-exclude must extend to cardinality greater than 3":
    check sum(10_000, @[2, 3, 5, 7, 11]) == 39_614_537
