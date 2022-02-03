import
  std / unittest

import
  prime_factors

suite "prime-factors tests":
  test "no factors":
    check factors(1) == newSeq[int]()
  test "prime number":
    check factors(2) == @[2]
  test "another prime number":
    check factors(3) == @[3]
  test "square of a prime":
    check factors(9) == @[3, 3]
  test "product of first prime":
    check factors(4) == @[2, 2]
  test "cube of a prime":
    check factors(8) == @[2, 2, 2]
  test "product of second prime":
    check factors(27) == @[3, 3, 3]
  test "product of third prime":
    check factors(625) == @[5, 5, 5, 5]
  test "product of first and second prime":
    check factors(6) == @[2, 3]
  test "product of primes and non-primes":
    check factors(12) == @[2, 2, 3]
  test "product of primes":
    check factors(901255) == @[5, 17, 23, 461]
  test "factors include a large prime":
    check factors(93819012551) == @[11, 9539, 894119]
