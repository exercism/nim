import unittest
import secret_handshake

# version 1.2.0

suite "Secret Handshake":
  test "wink for 1":
    check commands(1) == @["wink"]

  test "double blink for 10":
    check commands(2) == @["double blink"]

  test "close your eyes for 100":
    check commands(4) == @["close your eyes"]

  test "jump for 1000":
    check commands(8) == @["jump"]

  test "combine two actions":
    check commands(3) == @["wink", "double blink"]

  test "reverse two actions":
    check commands(19) == @["double blink", "wink"]

  test "reversing one action gives the same action":
    check commands(24) == @["jump"]

  test "reversing no actions still gives no actions":
    check commands(16) == newSeq[string]()

  test "all possible actions":
    check commands(15) == @["wink", "double blink", "close your eyes", "jump"]

  test "reverse all possible actions":
    check commands(31) == @["jump", "close your eyes", "double blink", "wink"]

  test "do nothing for zero":
    check commands(0) == newSeq[string]()
