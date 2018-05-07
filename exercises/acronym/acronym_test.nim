import unittest

import acronym

suite "Acronym":
  
  test "basic":
    check abbreviate("Portable Network Graphics") == "PNG"

  test "lowercase_words":
    check abbreviate("Ruby on Rails") == "ROR"

  test "punctuation":
    check abbreviate("First In, First Out") == "FIFO"
    
  test "all_caps_words":
    check abbreviate("GNU Image Manipulation Program") == "GIMP"

  test "punctuation_without_whitespace":
    check abbreviate("Complementary metal-oxide semiconductor") == "CMOS"
