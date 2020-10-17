import unittest
import isbn_verifier

suite "ISBN Verifier":
  test "valid ISBN":
    check isValid("3-598-21508-8") == true

  test "invalid ISBN check digit":
    check isValid("3-598-21508-9") == false

  test "valid ISBN with a check digit of 10":
    check isValid("3-598-21507-X") == true

  test "check digit is a character other than X":
    check isValid("3-598-21507-A") == false

  test "invalid character in ISBN":
    check isValid("3-598-P1581-X") == false

  test "X is only valid as a check digit":
    check isValid("3-598-2X507-9") == false

  test "valid ISBN without separating dashes":
    check isValid("3598215088") == true

  test "ISBN without separating dashes and X as check digit":
    check isValid("359821507X") == true

  test "ISBN without check digit and dashes":
    check isValid("359821507") == false

  test "too long ISBN and no dashes":
    check isValid("3598215078X") == false

  test "too short ISBN":
    check isValid("00") == false

  test "ISBN without check digit":
    check isValid("3-598-21507") == false

  test "check digit of X should not be used for 0":
    check isValid("3-598-21515-X") == false

  test "empty ISBN":
    check isValid("") == false

  test "input is 9 characters":
    check isValid("134456729") == false

  test "invalid characters are not ignored":
    check isValid("3132P34035") == false

  test "input is too long but contains a valid ISBN":
    check isValid("98245726788") == false
