import unittest
import crypto_square

suite "Crypto Square":
  test "empty plaintext results in an empty ciphertext":
    check encrypt("") == ""

  test "lowercase":
    check encrypt("A") == "a"

  test "remove spaces":
    check encrypt("  b ") == "b"

  test "remove punctuation":
    check encrypt("@1,%!") == "1"

  test "9 character plaintext results in 3 chunks of 3 characters":
    check encrypt("This is fun!") == "tsf hiu isn"

  test "8 character plaintext results in 3 chunks, the last one with a trailing space":
    check encrypt("Chill out.") == "clu hlt io "

  test "54 character plaintext results in 7 chunks, the last two with trailing spaces":
    const pt = "If man was meant to stay on the ground, god would have given us roots."
    const expected = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
    check encrypt(pt) == expected
