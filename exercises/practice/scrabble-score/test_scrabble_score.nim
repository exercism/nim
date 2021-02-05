import unittest
import scrabble_score

suite "Scrabble Score":
  test "lowercase letter":
    check score("a") == 1

  test "uppercase letter":
    check score("A") == 1

  test "valuable letter":
    check score("f") == 4

  test "short word":
    check score("at") == 2

  test "short, valuable word":
    check score("zoo") == 12

  test "medium word":
    check score("street") == 6

  test "medium, valuable word":
    check score("quirky") == 22

  test "long, mixed-case word":
    check score("OxyphenButazone") == 41

  test "english-like word":
    check score("pinata") == 8

  test "empty input":
    check score("") == 0

  test "entire alphabet available":
    check score("abcdefghijklmnopqrstuvwxyz") == 87
