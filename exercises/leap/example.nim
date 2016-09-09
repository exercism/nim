proc isLeapYear*(y: int): bool {.noSideEffect, procvar.} =
  ## Returns true if `y` is a leap year.
  ##
  ## .. code-block:: nimrod
  ##   assert isLeapYear(2012)
  y mod 4 == 0 and (y mod 100 != 0 or y mod 400 == 0)
