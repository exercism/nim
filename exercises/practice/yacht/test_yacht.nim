import
  std / unittest

import
  yacht

suite "yacht tests":
  test "Yacht":
    check score(@[5, 5, 5, 5, 5], "yacht") == 50
  test "Not Yacht":
    check score(@[1, 3, 3, 2, 5], "yacht") == 0
  test "Ones":
    check score(@[1, 1, 1, 3, 5], "ones") == 3
  test "Ones, out of order":
    check score(@[3, 1, 1, 5, 1], "ones") == 3
  test "No ones":
    check score(@[4, 3, 6, 5, 5], "ones") == 0
  test "Twos":
    check score(@[2, 3, 4, 5, 6], "twos") == 2
  test "Fours":
    check score(@[1, 4, 1, 4, 1], "fours") == 8
  test "Yacht counted as threes":
    check score(@[3, 3, 3, 3, 3], "threes") == 15
  test "Yacht of 3s counted as fives":
    check score(@[3, 3, 3, 3, 3], "fives") == 0
  test "Sixes":
    check score(@[2, 3, 4, 5, 6], "sixes") == 6
  test "Full house two small, three big":
    check score(@[2, 2, 4, 4, 4], "full house") == 16
  test "Full house three small, two big":
    check score(@[5, 3, 3, 5, 3], "full house") == 19
  test "Two pair is not a full house":
    check score(@[2, 2, 4, 4, 5], "full house") == 0
  test "Four of a kind is not a full house":
    check score(@[1, 4, 4, 4, 4], "full house") == 0
  test "Yacht is not a full house":
    check score(@[2, 2, 2, 2, 2], "full house") == 0
  test "Four of a Kind":
    check score(@[6, 6, 4, 6, 6], "four of a kind") == 24
  test "Yacht can be scored as Four of a Kind":
    check score(@[3, 3, 3, 3, 3], "four of a kind") == 12
  test "Full house is not Four of a Kind":
    check score(@[3, 3, 3, 5, 5], "four of a kind") == 0
  test "Little Straight":
    check score(@[3, 5, 4, 1, 2], "little straight") == 30
  test "Little Straight as Big Straight":
    check score(@[1, 2, 3, 4, 5], "big straight") == 0
  test "Four in order but not a little straight":
    check score(@[1, 1, 2, 3, 4], "little straight") == 0
  test "No pairs but not a little straight":
    check score(@[1, 2, 3, 4, 6], "little straight") == 0
  test "Minimum is 1, maximum is 5, but not a little straight":
    check score(@[1, 1, 3, 4, 5], "little straight") == 0
  test "Big Straight":
    check score(@[4, 6, 2, 5, 3], "big straight") == 30
  test "Big Straight as little straight":
    check score(@[6, 5, 4, 3, 2], "little straight") == 0
  test "No pairs but not a big straight":
    check score(@[6, 5, 4, 3, 1], "big straight") == 0
  test "Choice":
    check score(@[3, 3, 5, 6, 6], "choice") == 23
  test "Yacht as choice":
    check score(@[2, 2, 2, 2, 2], "choice") == 10
