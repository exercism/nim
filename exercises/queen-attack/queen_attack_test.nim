import unittest
import queen_attack

suite "Queen Attack":
  # Raise an error for invalid positions
  test "invalid position in canAttack":
    expect(ValueError):
      discard canAttack((0, 0), (7, 8))


  # Test the ability of one queen to attack another
  test "true attacks":
    var positions: seq[tuple[white, black: tuple[rank, file: int]]] = @[((2, 3), (5, 6)),
                                                                        ((2, 6), (5, 3)),
                                                                        ((2, 4), (2, 7)),
                                                                        ((5, 4), (2, 4)),
                                                                        ((1, 1), (6, 6)),
                                                                        ((0, 6), (1, 7))]
    for position in positions:
      check canAttack(position.white, position.black)

  test "false attacks":
    var positions: seq[tuple[white, black: tuple[rank, file: int]]] = @[((4, 2), (0, 5)),
                                                                        ((2, 3), (4, 7))]
    for position in positions:
      check (not canAttack(position.white, position.black))


  # Bonus: graphical board representation
  test "board1":
    check board((2, 3), (5, 6)) == @["________",
                                     "________",
                                     "___W____",
                                     "________",
                                     "________",
                                     "______B_",
                                     "________",
                                     "________"]

  test "board2":
    check board((0, 6), (1, 7)) == @["______W_",
                                     "_______B",
                                     "________",
                                     "________",
                                     "________",
                                     "________",
                                     "________",
                                     "________"]


  # Bonus: raise an error for invalid positions
  test "invalid position on board":
    expect(ValueError):
      discard board((0, 0), (7, 8))


  # Bonus: raise an error if queens occupy the same position
  test "queens in same position in canAttack":
    expect(ValueError):
      discard canAttack((2, 2), (2, 2))

  test "queens in same position on board":
    expect(ValueError):
      discard board((2, 2), (2, 2))
