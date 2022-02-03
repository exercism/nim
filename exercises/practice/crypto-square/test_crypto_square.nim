import
  std / unittest

import
  crypto_square

suite "crypto-square tests":
  test "empty plaintext results in an empty ciphertext":
    check ciphertext("") == ""
  test "Lowercase":
    check ciphertext("A") == "a"
  test "Remove spaces":
    check ciphertext("  b ") == "b"
  test "Remove punctuation":
    check ciphertext("@1,%!") == "1"
  test "9 character plaintext results in 3 chunks of 3 characters":
    check ciphertext("This is fun!") == "tsf hiu isn"
  test "8 character plaintext results in 3 chunks, the last one with a trailing space":
    check ciphertext("Chill out.") == "clu hlt io "
  test "54 character plaintext results in 7 chunks, the last two with trailing spaces":
    check ciphertext("If man was meant to stay on the ground, god would have given us roots.") ==
        "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
