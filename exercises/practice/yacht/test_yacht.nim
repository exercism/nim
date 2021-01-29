import unittest
import yacht

suite "Yacht":
  test "Yacht":
    check score([5, 5, 5, 5, 5], Yacht) == 50

  test "not Yacht":
    check score([1, 3, 3, 2, 5], Yacht) == 0

  test "Ones":
    check score([1, 1, 1, 3, 5], Ones) == 3

  test "Ones, out of order":
    check score([3, 1, 1, 5, 1], Ones) == 3

  test "no Ones":
    check score([4, 3, 6, 5, 5], Ones) == 0

  test "Twos":
    check score([2, 3, 4, 5, 6], Twos) == 2

  test "Fours":
    check score([1, 4, 1, 4, 1], Fours) == 8

  test "Yacht counted as Threes":
    check score([3, 3, 3, 3, 3], Threes) == 15

  test "Yacht of 3s counted as Fives":
    check score([3, 3, 3, 3, 3], Fives) == 0

  test "Sixes":
    check score([2, 3, 4, 5, 6], Sixes) == 6

  test "Full House: two small, three big":
    check score([2, 2, 4, 4, 4], FullHouse) == 16

  test "Full House: three small, two big":
    check score([5, 3, 3, 5, 3], FullHouse) == 19

  test "two pair is not a Full House":
    check score([2, 2, 4, 4, 5], FullHouse) == 0

  test "Four of a Kind is not a Full House":
    check score([1, 4, 4, 4, 4], FullHouse) == 0

  test "Yacht is not a Full House":
    check score([2, 2, 2, 2, 2], FullHouse) == 0

  test "Four of a Kind":
    check score([6, 6, 4, 6, 6], FourOfAKind) == 24

  test "Yacht can be scored as Four of a Kind":
    check score([3, 3, 3, 3, 3], FourOfAKind) == 12

  test "Full House is not Four of a Kind":
    check score([3, 3, 3, 5, 5], FourOfAKind) == 0

  test "Little Straight":
    check score([3, 5, 4, 1, 2], LittleStraight) == 30

  test "Little Straight as Big Straight":
    check score([1, 2, 3, 4, 5], BigStraight) == 0

  test "four in order but not a Little Straight":
    check score([1, 1, 2, 3, 4], LittleStraight) == 0

  test "no pairs but not a Little Straight":
    check score([1, 2, 3, 4, 6], LittleStraight) == 0

  test "minimum is 1, maximum is 5, but not a Little Straight":
    check score([1, 1, 3, 4, 5], LittleStraight) == 0

  test "Big Straight":
    check score([4, 6, 2, 5, 3], BigStraight) == 30

  test "Big Straight as Little Straight":
    check score([6, 5, 4, 3, 2], LittleStraight) == 0

  test "no pairs but not a Big Straight":
    check score([6, 5, 4, 3, 1], BigStraight) == 0

  test "Choice":
    check score([3, 3, 5, 6, 6], Choice) == 23

  test "Yacht as Choice":
    check score([2, 2, 2, 2, 2], Choice) == 10
