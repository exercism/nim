import unittest
import rotational_cipher

suite "Rotational Cipher":
  test "rotate a by 0, same output as input":
    check rotate("a", 0) == "a"

  test "rotate a by 1":
    check rotate("a", 1) == "b"

  test "rotate a by 26, same output as input":
    check rotate("a", 26) == "a"

  test "rotate m by 13":
    check rotate("m", 13) == "z"

  test "rotate n by 13 with wrap around alphabet":
    check rotate("n", 13) == "a"

  test "rotate capital letters":
    check rotate("OMG", 5) == "TRL"

  test "rotate spaces":
    check rotate("O M G", 5) == "T R L"

  test "rotate numbers":
    check rotate("Testing 1 2 3 testing", 4) == "Xiwxmrk 1 2 3 xiwxmrk"

  test "rotate punctuation":
    check rotate("Let's eat, Grandma!", 21) == "Gzo'n zvo, Bmviyhv!"

  test "rotate all letters":
    check rotate("The quick brown fox jumps over the lazy dog.",
                 13) == "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
