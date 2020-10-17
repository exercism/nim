import unittest
import pangram

suite "Pangram":
  test "empty sentence":
    check isPangram("") == false

  test "perfect lower case":
    check isPangram("abcdefghijklmnopqrstuvwxyz") == true

  test "only lower case":
    check isPangram("the quick brown fox jumps over the lazy dog") == true

  test "missing the letter 'x'":
    check isPangram("a quick movement of the enemy will jeopardize five gunboats") == false

  test "missing the letter 'h'":
    check isPangram("five boxing wizards jump quickly at it") == false

  test "with underscores":
    check isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog") == true

  test "with numbers":
    check isPangram("the 1 quick brown fox jumps over the 2 lazy dogs") == true

  test "missing letters replaced by numbers":
    check isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog") == false

  test "mixed case and punctuation":
    check isPangram("\"Five quacking Zephyrs jolt my wax bed.\"") == true

  test "case insensitive":
    check isPangram("the quick brown fox jumps over with lazy FX") == false
