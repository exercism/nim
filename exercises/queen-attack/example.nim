proc isValid(white, black: tuple[rank, file: int]): bool =
  white.rank < 8 and white.rank >= 0 and white.file < 8 and white.file >= 0 and
    black.rank < 8 and black.rank >= 0 and black.file < 8 and black.file >= 0

proc validate(white, black: tuple[rank, file: int]): void =
  if not isValid(white, black) or white == black:
    raise newException(ValueError, "Invalid positions")

proc board*(white, black: tuple[rank, file: int]): seq[string] =
  validate(white, black)

  var board: seq[string] = @[]

  for rank in 0..7:
    board.add("")
    for file in 0..7:
      if white == (rank, file):
        board[rank] &= 'W'
      elif black == (rank, file):
        board[rank] &= 'B'
      else:
        board[rank] &= '_'

  board

proc canAttack*(white, black: tuple[rank, file: int]): bool =
  validate(white, black)

  let rankDiff = abs(white.rank - black.rank)
  let fileDiff = abs(white.file - black.file)

  rankDiff == fileDiff or rankDiff * fileDiff == 0
