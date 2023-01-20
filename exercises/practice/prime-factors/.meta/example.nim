func primeFactors*(n: int64): seq[int] =
  var n = n
  var d = 2

  while n > 1:
    while n mod d == 0:
      n = n div d
      result.add d

    inc d
