import
  std / unittest

import
  high_scores

suite "high-scores tests":
  test "List of scores":
    check scores(@[30, 50, 20, 70]) == @[30, 50, 20, 70]
  test "Latest score":
    check latest(@[100, 0, 90, 30]) == 30
  test "Personal best":
    check personalBest(@[40, 100, 70]) == 100
suite "Top 3 scores":
  test "Personal top three from a list of scores":
    check personalTopThree(@[10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]) ==
        @[100, 90, 70]
  test "Personal top highest to lowest":
    check personalTopThree(@[20, 10, 30]) == @[30, 20, 10]
  test "Personal top when there is a tie":
    check personalTopThree(@[40, 20, 40, 30]) == @[40, 40, 30]
  test "Personal top when there are less than 3":
    check personalTopThree(@[30, 70]) == @[70, 30]
  test "Personal top when there is only one":
    check personalTopThree(@[40]) == @[40]
  test "Latest score after personal top scores":
    check latestAfterTopThree(@[70, 50, 20, 30]) == 30
  test "Scores after personal top scores":
    check scoresAfterTopThree(@[30, 50, 20, 70]) == @[30, 50, 20, 70]
