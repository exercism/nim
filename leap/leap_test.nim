import unittest
from leap import isLeapYear

test "vanilla leap year":
  check isLeapYear(1996)

test "normal year":
  check (not isLeapYear(1997))

test "century":
  check (not isLeapYear(1900))

test "exceptional century":
  check isLeapYear(2000)
