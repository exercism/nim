import
  std / unittest

import
  gigasecond

suite "gigasecond tests":
  test "date only specification of time":
    check add("2011-04-25") == "2043-01-01T01:46:40"
  test "second test for date only specification of time":
    check add("1977-06-13") == "2009-02-19T01:46:40"
  test "third test for date only specification of time":
    check add("1959-07-19") == "1991-03-27T01:46:40"
  test "full time specified":
    check add("2015-01-24T22:00:00") == "2046-10-02T23:46:40"
  test "full time with day roll-over":
    check add("2015-01-24T23:59:59") == "2046-10-03T01:46:39"
