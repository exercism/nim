import unittest

import sum_of_multiples

suite "Sum of Multiples":

  test "multiples of 3 or 5 up to 1":
    check sum(1, @[3, 5]) == 0

  test "multiples of 3 or 5 up to 4":
    check sum(4, @[3, 5]) == 3

  test "multiples of 3 up to 7":
    check sum(7, @[3]) == 9

  test "multiples of 3 or 5 up to 10":
    check sum(10, @[3, 5]) == 23

  test "multiples of 3 or 5 up to 100":
    check sum(100, @[3, 5]) == 2318

  test "multiples of 3 or 5 up to 1000":
    check sum(1000, @[3, 5]) == 233168

  test "multiples of 7, 13 or 17 up to 20":
    check sum(20, @[7, 13, 17]) == 51

  test "multiples of 4 or 6 up to 15":
    check sum(15, @[4, 6]) == 30

  test "multiples of 5, 6 or 8 up to 150":
    check sum(150, @[5, 6, 8]) == 4419

  test "multiples of 5 or 25 up to 51":
    check sum(51, @[5, 25]) == 275

  test "multiples of 43 or 47 up to 10000":
    check sum(10000, @[43, 47]) == 2203160

  test "multiples of 1 up to 100":
    check sum(100, @[1]) == 4950

  test "multiples of 1 up to 100":
    check sum(10000, @[]) == 0
