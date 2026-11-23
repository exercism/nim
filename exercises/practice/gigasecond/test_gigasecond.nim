import unittest, times
import gigasecond

suite "Gigasecond":
  test "date only specification of time":
    let moment   = dateTime(2011, mApr, 25, 0, 0, 0, zone = utc())
    let expected = dateTime(2043, mJan, 1, 1, 46, 40, zone = utc())
    check addGigasecond(moment) == expected

  test "second test for date only specification of time":
    let moment   = dateTime(1977, mJun, 13, 0, 0, 0, zone = utc())
    let expected = dateTime(2009, mFeb, 19, 1, 46, 40, zone = utc())
    check addGigasecond(moment) == expected

  test "third test for date only specification of time":
    let moment   = dateTime(1959, mJul, 19, 0, 0, 0, zone = utc())
    let expected = dateTime(1991, mMar, 27, 1, 46, 40, zone = utc())
    check addGigasecond(moment) == expected

  test "full time specified":
    let moment   = dateTime(2015, mJan, 24, 22, 0, 0, zone = utc())
    let expected = dateTime(2046, mOct, 2, 23, 46, 40, zone = utc())
    check addGigasecond(moment) == expected

  test "full time with day roll-over":
    let moment   = dateTime(2015, mJan, 24, 23, 59, 59, zone = utc())
    let expected = dateTime(2046, mOct, 3, 1, 46, 39, zone = utc())
    check addGigasecond(moment) == expected
