from std/algorithm import reversed
from std/strutils import allCharsInSet

proc binary*(input: string): int {.raises: [ValueError]} =
  if not input.allCharsInSet({'0', '1'}):
    raise newException(ValueError, "not binary")
  else:
    var value = 0
    for factor, digit in reversed(input):
      if digit == '1':
        value += 1 shl factor
    return value
