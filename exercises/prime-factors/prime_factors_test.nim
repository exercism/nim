import unittest
import prime_factors

suite "Prime Factors":
  test "no factors":
    check primeFactors(1).len == 0

  test "prime number":
    check primeFactors(2) == @[2]

  test "square of a prime":
    check primeFactors(9) == @[3, 3]

  test "cube of a prime":
    check primeFactors(8) == @[2, 2, 2]

  test "product of primes and non-primes":
    check primeFactors(12) == @[2, 2, 3]

  test "product of primes":
    check primeFactors(901_255) == @[5, 17, 23, 461]

  test "factors include a large prime":
    check primeFactors(93_819_012_551) == @[11, 9_539, 894_119]
