import unittest, times

import gigasecond

suite "Gigasecond":

    test "date only specification of time":
        let birthday = initDateTime(25, mApr, 2011, 0, 0, 0, utc())
        let expected = initDateTime(1, mJan, 2043, 1, 46, 40, utc())
        check addGigasecond(birthday) == expected

    test "second test for date only specification of time":
        let birthday = initDateTime(13, mJun, 1977, 0, 0, 0, utc())
        let expected = initDateTime(19, mFeb, 2009, 1, 46, 40, utc())
        check addGigasecond(birthday) == expected

    test "third test for date only specification of time":
        let birthday = initDateTime(19, mJul, 1959, 0, 0, 0, utc())
        let expected = initDateTime(27, mMar, 1991, 1, 46, 40, utc())
        check addGigasecond(birthday) == expected

    test "full time specified":
        let birthday = initDateTime(24, mJan, 2015, 22, 0, 0, utc())
        let expected = initDateTime(2, mOct, 2046, 23, 46, 40, utc())
        check addGigasecond(birthday) == expected

    test "full time with day roll-over":
        let birthday = initDateTime(24, mJan, 2015, 23, 59, 59, utc())
        let expected = initDateTime(3, mOct, 2046, 1, 46, 39, utc())
        check addGigasecond(birthday) == expected


