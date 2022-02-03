import
  std / unittest

import
  armstrong_numbers

suite "armstrong-numbers tests":
  test "Zero is an Armstrong number":
    check isArmstrongNumber(0) == true
  test "Single-digit numbers are Armstrong numbers":
    check isArmstrongNumber(5) == true
  test "There are no two-digit Armstrong numbers":
    check isArmstrongNumber(10) == false
  test "Three-digit number that is an Armstrong number":
    check isArmstrongNumber(153) == true
  test "Three-digit number that is not an Armstrong number":
    check isArmstrongNumber(100) == false
  test "Four-digit number that is an Armstrong number":
    check isArmstrongNumber(9474) == true
  test "Four-digit number that is not an Armstrong number":
    check isArmstrongNumber(9475) == false
  test "Seven-digit number that is an Armstrong number":
    check isArmstrongNumber(9926315) == true
  test "Seven-digit number that is not an Armstrong number":
    check isArmstrongNumber(9926314) == false
