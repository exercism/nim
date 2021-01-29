import unittest
import two_fer

suite "Two Fer":
  test "no name given":
    check twoFer() == "One for you, one for me."

  test "a name given":
    let name = "Alice"
    check twoFer(name) == "One for Alice, one for me."

  test "another name given":
    let name = "Bob"
    check twoFer(name) == "One for Bob, one for me."
