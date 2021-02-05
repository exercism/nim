import unittest
import high_scores

suite "High Scores":
  test "latest score":
    check latest(@[100, 0, 90, 30]) == 30

  test "personal best":
    check personalBest(@[40, 100, 70]) == 100

  test "personal top three from a list of scores":
    check personalTopThree(@[10, 30, 90, 30, 100, 20,
                             10, 0, 30, 40, 40, 70, 70]) == @[100, 90, 70]

  test "personal top highest to lowest":
    check personalTopThree(@[20, 10, 30]) == @[30, 20, 10]

  test "personal top when there is a tie":
    check personalTopThree(@[40, 20, 40, 30]) == @[40, 40, 30]

  test "personal top when there are less than 3":
    check personalTopThree(@[30, 70]) == @[70, 30]

  test "personal top when there is only one":
    check personalTopThree(@[40]) == @[40]
