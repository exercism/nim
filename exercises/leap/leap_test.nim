import unittest
from leap import isLeapYear

suite "Leap":

  test "year not divisible by 4: common year":
    check isLeapYear(2015) == false
   
  test "year divisible by 4, not divisible by 100: leap year":
    check isLeapYear(1996) == true
  
  test "year divisible by 100, not divisible by 400: common year":
    check isLeapYear(2100) == false
  
  test "year divisible by 400: leap year":
    check isLeapYear(2000) == true
