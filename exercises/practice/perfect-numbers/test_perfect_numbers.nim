import unittest
import perfect_numbers

suite "Perfect Numbers":
  test "smallest perfect number is classified correctly":
    check classify(6) == Perfect

  test "medium perfect number is classified correctly":
    check classify(28) == Perfect

  test "large perfect number is classified correctly":
    check classify(33_550_336) == Perfect

  test "smallest abundant number is classified correctly":
    check classify(12) == Abundant

  test "medium abundant number is classified correctly":
    check classify(30) == Abundant

  test "large abundant number is classified correctly":
    check classify(33_550_335) == Abundant

  test "smallest prime deficient number is classified correctly":
    check classify(2) == Deficient

  test "smallest non-prime deficient number is classified correctly":
    check classify(4) == Deficient

  test "medium deficient number is classified correctly":
    check classify(32) == Deficient

  test "large deficient number is classified correctly":
    check classify(33_550_337) == Deficient

  test "edge case (no factors other than itself) is classified correctly":
    check classify(1) == Deficient

  test "zero is rejected (as it is not a positive integer)":
    expect ValueError:
      discard classify(0)

  test "negative integer is rejected (as it is not a positive integer)":
    expect ValueError:
      discard classify(-1)
