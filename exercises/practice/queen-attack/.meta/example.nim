type
  Queen* = object
    row*: range[0..7]
    col*: range[0..7]

func initQueen*(row, col: int): Queen =
  if row in {0..7} and col in {0..7}:
    result = Queen(row: row, col: col)
  else:
    raise newException(ValueError, "Invalid position")

func raiseIfSame(white, black: Queen) =
  if white == black:
    raise newException(ValueError, "The queens cannot have the same position")

func canAttack*(white, black: Queen): bool =
  raiseIfSame(white, black)
  let rowDiff = abs(white.row - black.row)
  let colDiff = abs(white.col - black.col)
  result = (rowDiff == colDiff) or (rowDiff * colDiff == 0)

func board*(white, black: Queen): string =
  raiseIfSame(white, black)
  result = """
________
________
________
________
________
________
________
________
"""
  result[white.row * 9 + white.col] = 'W'
  result[black.row * 9 + black.col] = 'B'
