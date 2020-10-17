import unittest
import isogram

suite "Isogram":
  test "empty string":
    check isIsogram("") == true

  test "isogram with only lower case characters":
    check isIsogram("isogram") == true

  test "word with one duplicated character":
    check isIsogram("eleven") == false

  test "word with one duplicated character from the end of the alphabet":
    check isIsogram("zzyzx") == false

  test "longest reported english isogram":
    check isIsogram("subdermatoglyphic") == true

  test "word with duplicated character in mixed case":
    check isIsogram("Alphabet") == false

  test "word with duplicated character in mixed case, lowercase first":
    check isIsogram("alphAbet") == false

  test "hypothetical isogrammic word with hyphen":
    check isIsogram("thumbscrew-japingly") == true

  test "hypothetical word with duplicated character following hyphen":
    check isIsogram("thumbscrew-jappingly") == false

  test "isogram with duplicated hyphen":
    check isIsogram("six-year-old") == true

  test "made-up name that is an isogram":
    check isIsogram("Emily Jung Schwartzkopf") == true

  test "duplicated character in the middle":
    check isIsogram("accentor") == false

  test "same first and last characters":
    check isIsogram("angola") == false
