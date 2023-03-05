type
  Queen* = object
    row*: int
    col*: int

proc initQueen*(row, col: int): Queen =
  discard

proc canAttack*(white, black: Queen): bool =
  discard

proc board*(white, black: Queen): string =
  discard
