import unittest

import armstrong_numbers

suite "Armstrong Numbers":

  test "Single digit numbers are Armstrong numbers":
    check 5.isArmstrongNumber == true

  test "There are no 2 digit Armstrong numbers":
    check 10.isArmstrongNumber == false

  test "Three digit number that is an Armstrong number":
    check 153.isArmstrongNumber == true

  test "Three digit number that is not an Armstrong number":
    check 100.isArmstrongNumber == false

  test "Four digit number that is an Armstrong number":
    check 9474.isArmstrongNumber == true

  test "Four digit number that is not an Armstrong number":
    check 9475.isArmstrongNumber == false

  test "Seven digit number that is an Armstrong number":
    check 9926315.isArmstrongNumber == true

  test "Four digit number that is an Armstrong number":
    check 9926314.isArmstrongNumber == false
