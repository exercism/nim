import unittest
import luhn

# version 1.4.0

suite "Luhn":
  test "single digit strings can not be valid":
    check isValid("1") == false

  test "a single zero is invalid":
    check isValid("0") == false

  test "a simple valid SIN that remains valid if reversed":
    check isValid("059") == true

  test "a simple valid SIN that becomes invalid if reversed":
    check isValid("59") == true

  test "a valid Canadian SIN":
    check isValid("055 444 285") == true

  test "invalid Canadian SIN":
    check isValid("055 444 286") == false

  test "invalid credit card":
    check isValid("8273 1232 7352 0569") == false

  test "valid number with an even number of digits":
    check isValid("095 245 88") == true

  test "valid strings with a non-digit included become invalid":
    check isValid("055a 444 285") == false

  test "valid strings with a non-digit added at the end become invalid":
    check isValid("059a") == false

  test "valid strings with punctuation included become invalid":
    check isValid("055-444-285") == false

  test "valid strings with symbols included become invalid":
    check isValid("055£ 444$ 285") == false

  test "single zero with space is invalid":
    check isValid(" 0") == false

  test "more than a single zero is valid":
    check isValid("0000 0") == true

  test "input digit 9 is correctly converted to output digit 9":
    check isValid("091") == true

  test "strings with non-digits is invalid":
    check isValid(":9") == false
