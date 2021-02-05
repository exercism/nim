import unittest, times
import meetup

suite "Meetup":
  test "monteenth of May 2013":
    check meetup(2013, 5, Teenth, dMon) == "2013-05-13"

  test "monteenth of August 2013":
    check meetup(2013, 8, Teenth, dMon) == "2013-08-19"

  test "monteenth of September 2013":
    check meetup(2013, 9, Teenth, dMon) == "2013-09-16"

  test "tuesteenth of March 2013":
    check meetup(2013, 3, Teenth, dTue) == "2013-03-19"

  test "tuesteenth of April 2013":
    check meetup(2013, 4, Teenth, dTue) == "2013-04-16"

  test "tuesteenth of August 2013":
    check meetup(2013, 8, Teenth, dTue) == "2013-08-13"

  test "wednesteenth of January 2013":
    check meetup(2013, 1, Teenth, dWed) == "2013-01-16"

  test "wednesteenth of February 2013":
    check meetup(2013, 2, Teenth, dWed) == "2013-02-13"

  test "wednesteenth of June 2013":
    check meetup(2013, 6, Teenth, dWed) == "2013-06-19"

  test "thursteenth of May 2013":
    check meetup(2013, 5, Teenth, dThu) == "2013-05-16"

  test "thursteenth of June 2013":
    check meetup(2013, 6, Teenth, dThu) == "2013-06-13"

  test "thursteenth of September 2013":
    check meetup(2013, 9, Teenth, dThu) == "2013-09-19"

  test "friteenth of April 2013":
    check meetup(2013, 4, Teenth, dFri) == "2013-04-19"

  test "friteenth of August 2013":
    check meetup(2013, 8, Teenth, dFri) == "2013-08-16"

  test "friteenth of September 2013":
    check meetup(2013, 9, Teenth, dFri) == "2013-09-13"

  test "saturteenth of February 2013":
    check meetup(2013, 2, Teenth, dSat) == "2013-02-16"

  test "saturteenth of April 2013":
    check meetup(2013, 4, Teenth, dSat) == "2013-04-13"

  test "saturteenth of October 2013":
    check meetup(2013, 10, Teenth, dSat) == "2013-10-19"

  test "sunteenth of May 2013":
    check meetup(2013, 5, Teenth, dSun) == "2013-05-19"

  test "sunteenth of June 2013":
    check meetup(2013, 6, Teenth, dSun) == "2013-06-16"

  test "sunteenth of October 2013":
    check meetup(2013, 10, Teenth, dSun) == "2013-10-13"

  test "first Monday of March 2013":
    check meetup(2013, 3, First, dMon) == "2013-03-04"

  test "first Monday of April 2013":
    check meetup(2013, 4, First, dMon) == "2013-04-01"

  test "first Tuesday of May 2013":
    check meetup(2013, 5, First, dTue) == "2013-05-07"

  test "first Tuesday of June 2013":
    check meetup(2013, 6, First, dTue) == "2013-06-04"

  test "first Wednesday of July 2013":
    check meetup(2013, 7, First, dWed) == "2013-07-03"

  test "first Wednesday of August 2013":
    check meetup(2013, 8, First, dWed) == "2013-08-07"

  test "first Thursday of September 2013":
    check meetup(2013, 9, First, dThu) == "2013-09-05"

  test "first Thursday of October 2013":
    check meetup(2013, 10, First, dThu) == "2013-10-03"

  test "first Friday of November 2013":
    check meetup(2013, 11, First, dFri) == "2013-11-01"

  test "first Friday of December 2013":
    check meetup(2013, 12, First, dFri) == "2013-12-06"

  test "first Saturday of January 2013":
    check meetup(2013, 1, First, dSat) == "2013-01-05"

  test "first Saturday of February 2013":
    check meetup(2013, 2, First, dSat) == "2013-02-02"

  test "first Sunday of March 2013":
    check meetup(2013, 3, First, dSun) == "2013-03-03"

  test "first Sunday of April 2013":
    check meetup(2013, 4, First, dSun) == "2013-04-07"

  test "second Monday of March 2013":
    check meetup(2013, 3, Second, dMon) == "2013-03-11"

  test "second Monday of April 2013":
    check meetup(2013, 4, Second, dMon) == "2013-04-08"

  test "second Tuesday of May 2013":
    check meetup(2013, 5, Second, dTue) == "2013-05-14"

  test "second Tuesday of June 2013":
    check meetup(2013, 6, Second, dTue) == "2013-06-11"

  test "second Wednesday of July 2013":
    check meetup(2013, 7, Second, dWed) == "2013-07-10"

  test "second Wednesday of August 2013":
    check meetup(2013, 8, Second, dWed) == "2013-08-14"

  test "second Thursday of September 2013":
    check meetup(2013, 9, Second, dThu) == "2013-09-12"

  test "second Thursday of October 2013":
    check meetup(2013, 10, Second, dThu) == "2013-10-10"

  test "second Friday of November 2013":
    check meetup(2013, 11, Second, dFri) == "2013-11-08"

  test "second Friday of December 2013":
    check meetup(2013, 12, Second, dFri) == "2013-12-13"

  test "second Saturday of January 2013":
    check meetup(2013, 1, Second, dSat) == "2013-01-12"

  test "second Saturday of February 2013":
    check meetup(2013, 2, Second, dSat) == "2013-02-09"

  test "second Sunday of March 2013":
    check meetup(2013, 3, Second, dSun) == "2013-03-10"

  test "second Sunday of April 2013":
    check meetup(2013, 4, Second, dSun) == "2013-04-14"

  test "third Monday of March 2013":
    check meetup(2013, 3, Third, dMon) == "2013-03-18"

  test "third Monday of April 2013":
    check meetup(2013, 4, Third, dMon) == "2013-04-15"

  test "third Tuesday of May 2013":
    check meetup(2013, 5, Third, dTue) == "2013-05-21"

  test "third Tuesday of June 2013":
    check meetup(2013, 6, Third, dTue) == "2013-06-18"

  test "third Wednesday of July 2013":
    check meetup(2013, 7, Third, dWed) == "2013-07-17"

  test "third Wednesday of August 2013":
    check meetup(2013, 8, Third, dWed) == "2013-08-21"

  test "third Thursday of September 2013":
    check meetup(2013, 9, Third, dThu) == "2013-09-19"

  test "third Thursday of October 2013":
    check meetup(2013, 10, Third, dThu) == "2013-10-17"

  test "third Friday of November 2013":
    check meetup(2013, 11, Third, dFri) == "2013-11-15"

  test "third Friday of December 2013":
    check meetup(2013, 12, Third, dFri) == "2013-12-20"

  test "third Saturday of January 2013":
    check meetup(2013, 1, Third, dSat) == "2013-01-19"

  test "third Saturday of February 2013":
    check meetup(2013, 2, Third, dSat) == "2013-02-16"

  test "third Sunday of March 2013":
    check meetup(2013, 3, Third, dSun) == "2013-03-17"

  test "third Sunday of April 2013":
    check meetup(2013, 4, Third, dSun) == "2013-04-21"

  test "fourth Monday of March 2013":
    check meetup(2013, 3, Fourth, dMon) == "2013-03-25"

  test "fourth Monday of April 2013":
    check meetup(2013, 4, Fourth, dMon) == "2013-04-22"

  test "fourth Tuesday of May 2013":
    check meetup(2013, 5, Fourth, dTue) == "2013-05-28"

  test "fourth Tuesday of June 2013":
    check meetup(2013, 6, Fourth, dTue) == "2013-06-25"

  test "fourth Wednesday of July 2013":
    check meetup(2013, 7, Fourth, dWed) == "2013-07-24"

  test "fourth Wednesday of August 2013":
    check meetup(2013, 8, Fourth, dWed) == "2013-08-28"

  test "fourth Thursday of September 2013":
    check meetup(2013, 9, Fourth, dThu) == "2013-09-26"

  test "fourth Thursday of October 2013":
    check meetup(2013, 10, Fourth, dThu) == "2013-10-24"

  test "fourth Friday of November 2013":
    check meetup(2013, 11, Fourth, dFri) == "2013-11-22"

  test "fourth Friday of December 2013":
    check meetup(2013, 12, Fourth, dFri) == "2013-12-27"

  test "fourth Saturday of January 2013":
    check meetup(2013, 1, Fourth, dSat) == "2013-01-26"

  test "fourth Saturday of February 2013":
    check meetup(2013, 2, Fourth, dSat) == "2013-02-23"

  test "fourth Sunday of March 2013":
    check meetup(2013, 3, Fourth, dSun) == "2013-03-24"

  test "fourth Sunday of April 2013":
    check meetup(2013, 4, Fourth, dSun) == "2013-04-28"

  test "last Monday of March 2013":
    check meetup(2013, 3, Last, dMon) == "2013-03-25"

  test "last Monday of April 2013":
    check meetup(2013, 4, Last, dMon) == "2013-04-29"

  test "last Tuesday of May 2013":
    check meetup(2013, 5, Last, dTue) == "2013-05-28"

  test "last Tuesday of June 2013":
    check meetup(2013, 6, Last, dTue) == "2013-06-25"

  test "last Wednesday of July 2013":
    check meetup(2013, 7, Last, dWed) == "2013-07-31"

  test "last Wednesday of August 2013":
    check meetup(2013, 8, Last, dWed) == "2013-08-28"

  test "last Thursday of September 2013":
    check meetup(2013, 9, Last, dThu) == "2013-09-26"

  test "last Thursday of October 2013":
    check meetup(2013, 10, Last, dThu) == "2013-10-31"

  test "last Friday of November 2013":
    check meetup(2013, 11, Last, dFri) == "2013-11-29"

  test "last Friday of December 2013":
    check meetup(2013, 12, Last, dFri) == "2013-12-27"

  test "last Saturday of January 2013":
    check meetup(2013, 1, Last, dSat) == "2013-01-26"

  test "last Saturday of February 2013":
    check meetup(2013, 2, Last, dSat) == "2013-02-23"

  test "last Sunday of March 2013":
    check meetup(2013, 3, Last, dSun) == "2013-03-31"

  test "last Sunday of April 2013":
    check meetup(2013, 4, Last, dSun) == "2013-04-28"

  test "last Wednesday of February 2012":
    check meetup(2012, 2, Last, dWed) == "2012-02-29"

  test "last Wednesday of December 2014":
    check meetup(2014, 12, Last, dWed) == "2014-12-31"

  test "last Sunday of February 2015":
    check meetup(2015, 2, Last, dSun) == "2015-02-22"

  test "first Friday of December 2012":
    check meetup(2012, 12, First, dFri) == "2012-12-07"
