import unittest
import queen_attack

# version 2.3.0

suite "Queen Attack":
  # Raise an error for invalid positions
  test "invalid row: too low":
    expect(ValueError): discard canAttack((-2, 2), (0, 0))
    expect(ValueError): discard canAttack((0, 0), (-2, 2))

  test "invalid row: too high":
    expect(ValueError): discard canAttack((8, 4), (0, 0))
    expect(ValueError): discard canAttack((0, 0), (8, 4))

  test "invalid column: too low":
    expect(ValueError): discard canAttack((2, -2), (0, 0))
    expect(ValueError): discard canAttack((0, 0), (2, -2))

  test "invalid column: too high":
    expect(ValueError): discard canAttack((4, 8), (0, 0))
    expect(ValueError): discard canAttack((0, 0), (4, 8))


  # Test the ability of one queen to attack another
  test "cannot attack":
    check canAttack((2, 4), (6, 6)) == false

  test "can attack on same row":
    check canAttack((2, 4), (2, 6)) == true

  test "can attack on same column":
    check canAttack((4, 5), (2, 5)) == true

  test "can attack on first diagonal":
    check canAttack((2, 2), (0, 4)) == true

  test "can attack on second diagonal":
    check canAttack((2, 2), (3, 1)) == true

  test "can attack on third diagonal":
    check canAttack((2, 2), (1, 1)) == true

  test "can attack on fourth diagonal":
    check canAttack((1, 7), (0, 6)) == true


  # Bonus: graphical board representation
  test "represent a board graphically #1":
    check board((2, 3), (5, 6)) == @["________",
                                     "________",
                                     "___W____",
                                     "________",
                                     "________",
                                     "______B_",
                                     "________",
                                     "________"]

  test "represent a board graphically #2":
    check board((0, 6), (1, 7)) == @["______W_",
                                     "_______B",
                                     "________",
                                     "________",
                                     "________",
                                     "________",
                                     "________",
                                     "________"]


  # Bonus: raise an error for invalid positions
  test "invalid row: too low (board)":
    expect(ValueError): discard board((-2, 2), (0, 0))
    expect(ValueError): discard board((0, 0), (-2, 2))

  test "invalid row: too high (board)":
    expect(ValueError): discard board((8, 4), (0, 0))
    expect(ValueError): discard board((0, 0), (8, 4))

  test "invalid column: too low (board)":
    expect(ValueError): discard board((2, -2), (0, 0))
    expect(ValueError): discard board((0, 0), (2, -2))

  test "invalid column: too high (board)":
    expect(ValueError): discard board((4, 8), (0, 0))
    expect(ValueError): discard board((0, 0), (4, 8))


  # Bonus: raise an error if queens occupy the same position
  test "queens cannot have the same position (canAttack)":
    expect(ValueError):
      discard canAttack((2, 2), (2, 2))

  test "queens cannot have the same position (board)":
    expect(ValueError):
      discard board((2, 2), (2, 2))
