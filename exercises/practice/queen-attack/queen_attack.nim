type
  Queen* = object
    row*: range[0..7]
    col*: range[0..7]

proc initQueen*(row, col: int): Queen =
  discard

proc canAttack*(white, black: Queen): bool =
  discard

proc board*(white, black: Queen): string =
  discard
