import unittest
import two_bucket

suite "two-bucket":
  test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one":
    check measure(3, 5, 1, "one") == (possible: true, moves: 4, goalBucket: "one", otherBucket: 5)

  test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two":
    check measure(3, 5, 1, "two") == (possible: true, moves: 8, goalBucket: "two", otherBucket: 3)

  test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one":
    check measure(7, 11, 2, "one") == (possible: true, moves: 14, goalBucket: "one", otherBucket: 11)

  test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two":
    check measure(7, 11, 2, "two") == (possible: true, moves: 18, goalBucket: "two", otherBucket: 7)

  test "Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two":
    check measure(1, 3, 3, "two") == (possible: true, moves: 1, goalBucket: "two", otherBucket: 0)

  test "Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two":
    check measure(2, 3, 3, "one") == (possible: true, moves: 2, goalBucket: "two", otherBucket: 2)

  test "Not possible to reach the goal":
    check not measure(6, 15, 5, "one").possible

  test "With the same buckets but a different goal, then it is possible":
    check measure(6, 15, 9, "one") == (possible: true, moves: 10, goalBucket: "two", otherBucket: 0)

  test "Goal larger than both buckets is impossible":
    check not measure(5, 7, 8, "one").possible

