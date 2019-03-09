import random

randomize()

func powMod(b: Natural, e: Natural, m: Positive): int =
  ## Returns the value of `b` raised to the power `e`, modulo `m`.
  ## Running time is O(log e). It is O(e) for the naive `b^e mod m`.
  ## This will overflow if m > int.high.float.sqrt
  result = 1
  var b = b mod m
  var e = e

  while e > 0:
    if (e and 1) == 1:
      result = (result * b) mod m
    e = e shr 1
    b = (b * b) mod m

proc privateKey*(p: int): int =
  rand(2 ..< p)

func publicKey*(p, g, a: int): int =
  powMod(g, a, p)

func secret*(p, bPub, a: int): int =
  powMod(bPub, a, p)
