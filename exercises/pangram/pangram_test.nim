import unittest
import pangram

# version 1.4.1

suite "Pangram":
  test "sentence empty":
    check isPangram("") == false

  test "recognizes a perfect lower case pangram":
    check isPangram("abcdefghijklmnopqrstuvwxyz") == true

  test "pangram with only lower case":
    check isPangram("the quick brown fox jumps over the lazy dog") == true

  test "missing character 'x'":
    check isPangram("a quick movement of the enemy will jeopardize five gunboats") == false

  test "another missing character, e.g. 'h'":
    check isPangram("five boxing wizards jump quickly at it") == false

  test "pangram with underscores":
    check isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog") == true

  test "pangram with numbers":
    check isPangram("the 1 quick brown fox jumps over the 2 lazy dogs") == true

  test "missing letters replaced by numbers":
    check isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog") == false

  test "pangram with mixed case and punctuation":
    check isPangram("\"Five quacking Zephyrs jolt my wax bed.\"") == true

  test "upper and lower case versions of the same character should not be counted separately":
    check isPangram("the quick brown fox jumps over with lazy FX") == false
