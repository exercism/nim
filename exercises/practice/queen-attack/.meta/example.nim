import std/strutils

type
  Queen* = object
    row*: range[0..7]
    col*: range[0..7]

func initQueen*(row, col: int): Queen =
  if row in {0..7} and col in {0..7}:
    Queen(row: row, col: col)
  else:
    raise newException(ValueError, "Invalid position")

func canAttack*(white, black: Queen): bool =
  if white != black:
    white.row == black.row or white.col == black.col or
        abs(white.row - black.row) == abs(white.col - black.col)
  else:
    raise newException(ValueError, "The queens cannot have the same position")

func board*(white, black: Queen): string =
  if white != black:
    const emptyBoard = """
      ________
      ________
      ________
      ________
      ________
      ________
      ________
      ________
    """.unindent()
    result = emptyBoard
    result[white.row * 9 + white.col] = 'W'
    result[black.row * 9 + black.col] = 'B'
  else:
    raise newException(ValueError, "The queens cannot have the same position")
