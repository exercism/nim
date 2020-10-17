import unittest
import armstrong_numbers

suite "Armstrong Numbers":
  test "zero is an Armstrong number":
    check isArmstrongNumber(0) == true

  test "single-digit numbers are Armstrong numbers":
    check isArmstrongNumber(5) == true

  test "there are no two-digit Armstrong numbers":
    check isArmstrongNumber(10) == false

  test "three-digit number that is an Armstrong number":
    check isArmstrongNumber(153) == true

  test "three-digit number that is not an Armstrong number":
    check isArmstrongNumber(100) == false

  test "four-digit number that is an Armstrong number":
    check isArmstrongNumber(9474) == true

  test "four-digit number that is not an Armstrong number":
    check isArmstrongNumber(9475) == false

  test "seven-digit number that is an Armstrong number":
    check isArmstrongNumber(9_926_315) == true

  test "seven-digit number that is not an Armstrong number":
    check isArmstrongNumber(9_926_314) == false
