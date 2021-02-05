import unittest
import roman_numerals

suite "Roman Numerals":
  test "1 is a single I":
    check roman(1) == "I"

  test "2 is two I's":
    check roman(2) == "II"

  test "3 is three I's":
    check roman(3) == "III"

  test "4, being 5 - 1, is IV":
    check roman(4) == "IV"

  test "5 is a single V":
    check roman(5) == "V"

  test "6, being 5 + 1, is VI":
    check roman(6) == "VI"

  test "9, being 10 - 1, is IX":
    check roman(9) == "IX"

  test "20 is two X's":
    check roman(27) == "XXVII"

  test "48 is not 50 - 2 but rather 40 + 8":
    check roman(48) == "XLVIII"

  test "49 is not 40 + 5 + 4 but rather 50 - 10 + 10 - 1":
    check roman(49) == "XLIX"

  test "50 is a single L":
    check roman(59) == "LIX"

  test "90, being 100 - 10, is XC":
    check roman(93) == "XCIII"

  test "100 is a single C":
    check roman(141) == "CXLI"

  test "60, being 50 + 10, is LX":
    check roman(163) == "CLXIII"

  test "400, being 500 - 100, is CD":
    check roman(402) == "CDII"

  test "500 is a single D":
    check roman(575) == "DLXXV"

  test "900, being 1000 - 100, is CM":
    check roman(911) == "CMXI"

  test "1000 is a single M":
    check roman(1024) == "MXXIV"

  test "3000 is three M's":
    check roman(3000) == "MMM"
