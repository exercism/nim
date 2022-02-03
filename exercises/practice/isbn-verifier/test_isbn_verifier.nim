import
  std / unittest

import
  isbn_verifier

suite "isbn-verifier tests":
  test "valid isbn":
    check isValid("3-598-21508-8") == true
  test "invalid isbn check digit":
    check isValid("3-598-21508-9") == false
  test "valid isbn with a check digit of 10":
    check isValid("3-598-21507-X") == true
  test "check digit is a character other than X":
    check isValid("3-598-21507-A") == false
  test "invalid character in isbn is not treated as zero":
    check isValid("3-598-P1581-X") == false
  test "X is only valid as a check digit":
    check isValid("3-598-2X507-9") == false
  test "valid isbn without separating dashes":
    check isValid("3598215088") == true
  test "isbn without separating dashes and X as check digit":
    check isValid("359821507X") == true
  test "isbn without check digit and dashes":
    check isValid("359821507") == false
  test "too long isbn and no dashes":
    check isValid("3598215078X") == false
  test "too short isbn":
    check isValid("00") == false
  test "isbn without check digit":
    check isValid("3-598-21507") == false
  test "check digit of X should not be used for 0":
    check isValid("3-598-21515-X") == false
  test "empty isbn":
    check isValid("") == false
  test "input is 9 characters":
    check isValid("134456729") == false
  test "invalid characters are not ignored after checking length":
    check isValid("3132P34035") == false
  test "invalid characters are not ignored before checking length":
    check isValid("3598P215088") == false
  test "input is too long but contains a valid isbn":
    check isValid("98245726788") == false
