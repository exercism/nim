import unittest
import raindrops

suite "Raindrops":
  test "the sound for 1 is 1":
    check convert(1) == "1"

  test "the sound for 3 is Pling":
    check convert(3) == "Pling"

  test "the sound for 5 is Plang":
    check convert(5) == "Plang"

  test "the sound for 7 is Plong":
    check convert(7) == "Plong"

  test "the sound for 6 is Pling as it has a factor 3":
    check convert(6) == "Pling"

  test "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base":
    check convert(8) == "8"

  test "the sound for 9 is Pling as it has a factor 3":
    check convert(9) == "Pling"

  test "the sound for 10 is Plang as it has a factor 5":
    check convert(10) == "Plang"

  test "the sound for 14 is Plong as it has a factor 7":
    check convert(14) == "Plong"

  test "the sound for 15 is PlingPlang as it has factors 3 and 5":
    check convert(15) == "PlingPlang"

  test "the sound for 21 is PlingPlong as it has factors 3 and 7":
    check convert(21) == "PlingPlong"

  test "the sound for 25 is Plang as it has a factor 5":
    check convert(25) == "Plang"

  test "the sound for 27 is Pling as it has a factor 3":
    check convert(27) == "Pling"

  test "the sound for 35 is PlangPlong as it has factors 5 and 7":
    check convert(35) == "PlangPlong"

  test "the sound for 49 is Plong as it has a factor 7":
    check convert(49) == "Plong"

  test "the sound for 52 is 52":
    check convert(52) == "52"

  test "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7":
    check convert(105) == "PlingPlangPlong"

  test "the sound for 3125 is Plang as it has a factor 5":
    check convert(3125) == "Plang"
