func squareOfSum*(n: int): int =
  result = n * (n + 1) div 2
  result *= result

func sumOfSquares*(n: int): int =
  (n * (n + 1) * ((2 * n) + 1)) div 6

func difference*(n: int): int =
  squareOfSum(n) - sumOfSquares(n)
