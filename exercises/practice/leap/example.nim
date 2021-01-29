func isLeapYear*(y: int): bool =
  ## Returns true if `y` is a leap year.
  ##
  ## .. code-block:: nim
  ##   assert isLeapYear(2012)
  y mod 4 == 0 and (y mod 100 != 0 or y mod 400 == 0)
