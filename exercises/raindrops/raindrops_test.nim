import unittest

import raindrops

suite "Raindrops":
  
  test "convert 1":
    check convert(1) == "1"

  test "convert 3":
    check convert(3) == "Pling"

  test "convert 5":
    check convert(5) == "Plang"

  test "convert 7":
    check convert(7) == "Plong"

  test "convert 6":
    check convert(6) == "Pling"

  test "convert 9":
    check convert(9) == "Pling"

  test "convert 10":
    check convert(10) == "Plang"

  test "convert 14":
    check convert(14) == "Plong"

  test "convert 15":
    check convert(15) == "PlingPlang"

  test "convert 21":
    check convert(21) == "PlingPlong"

  test "convert 25":
    check convert(25) == "Plang"

  test "convert 35":
    check convert(35) == "PlangPlong"

  test "convert 49":
    check convert(49) == "Plong"

  test "convert 52":
    check convert(52) == "52"

  test "convert 105":
    check convert(105) == "PlingPlangPlong"

  test "convert 12121":
    check convert(12121) == "12121"
