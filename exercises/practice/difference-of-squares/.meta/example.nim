proc `**`(base, exponent: int): int =
  var power = 1
  for i in 1..exponent:
    power *= base
  power

proc squareOfSum*(n: int): int =
  (n * (n + 1) div 2) ** 2

proc sumOfSquares*(n: int): int =
  (n * (n + 1) * ((2 * n) + 1)) div 6

proc difference*(n: int): int =
  abs(sumOfSquares(n) - squareOfSum(n))
