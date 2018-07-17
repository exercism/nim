proc steps*(number: int): int =
  if (number < 1):
    raise newException(ValueError, "Only positive numbers are allowed")

  var n = number;
  while (n != 1):
    if (n mod 2 == 0):
      n = (n / 2).toInt
    else:
      n = 3 * n + 1

    result.inc
