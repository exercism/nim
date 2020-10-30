import unittest
import say

suite "Say":
  test "zero":
    check say(0) == "zero"

  test "one":
    check say(1) == "one"

  test "fourteen":
    check say(14) == "fourteen"

  test "twenty":
    check say(20) == "twenty"

  test "twenty-two":
    check say(22) == "twenty-two"

  test "one hundred":
    check say(100) == "one hundred"

  test "one hundred twenty-three":
    check say(123) == "one hundred twenty-three"

  test "one thousand":
    check say(1000) == "one thousand"

  test "one thousand two hundred thirty-four":
    check say(1234) == "one thousand two hundred thirty-four"

  test "one million":
    check say(1_000_000) == "one million"

  test "one million two thousand three hundred forty-five":
    check say(1_002_345) == "one million two thousand three hundred forty-five"

  test "one billion":
    check say(1_000_000_000) == "one billion"

  test "a big number":
    check say(987_654_321_123) == "nine hundred eighty-seven billion " &
                                  "six hundred fifty-four million " &
                                  "three hundred twenty-one thousand " &
                                  "one hundred twenty-three"

  test "numbers below zero are out of range":
    expect ValueError:
      discard say(-1)

  test "numbers above 999,999,999,999 are out of range":
    expect ValueError:
      discard say(1_000_000_000_000)
