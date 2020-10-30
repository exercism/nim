import unittest
import reverse_string

suite "Reverse String":
  test "an empty string":
    check reverse("") == ""

  test "a word":
    check reverse("robot") == "tobor"

  test "a capitalized word":
    check reverse("Ramen") == "nemaR"

  test "a sentence with punctuation":
    check reverse("I'm hungry!") == "!yrgnuh m'I"

  test "a palindrome":
    check reverse("racecar") == "racecar"

  test "an even-sized word":
    check reverse("drawer") == "reward"
