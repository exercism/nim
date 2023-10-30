import unittest
import secret_handshake

suite "Secret Handshake":
  test "wink for 1":
    check commands(1) == @[Wink]

  test "double blink for 10":
    check commands(2) == @[DoubleBlink]

  test "close your eyes for 100":
    check commands(4) == @[CloseEyes]

  test "jump for 1000":
    check commands(8) == @[Jump]

  test "combine two actions":
    check commands(3) == @[Wink, DoubleBlink]

  test "reverse two actions":
    check commands(19) == @[DoubleBlink, Wink]

  test "reversing one action gives the same action":
    check commands(24) == @[Jump]

  test "reversing no actions still gives no actions":
    check commands(16).len == 0

  test "all possible actions":
    check commands(15) == @[Wink, DoubleBlink, CloseEyes, Jump]

  test "reverse all possible actions":
    check commands(31) == @[Jump, CloseEyes, DoubleBlink, Wink]

  test "do nothing for zero":
    check commands(0).len == 0
