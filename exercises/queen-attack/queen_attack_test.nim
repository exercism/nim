import unittest
import queen_attack

suite "Queen Attack":
  # Test creation of Queens with valid and invalid positions
  test "queen with a valid position":
    check:
      initQueen(2, 2) == Queen(row: 2, col: 2)

  test "queen must have positive row":
    expect(ValueError):
      discard initQueen(-2, 2)

  test "queen must have row on board":
    expect(ValueError):
      discard initQueen(8, 4)

  test "queen must have positive column":
    expect(ValueError):
      discard initQueen(2, -2)

  test "queen must have column on board":
    expect(ValueError):
      discard initQueen(4, 8)

  # Test the ability of one queen to attack another
  test "cannot attack":
    let whiteQueen = initQueen(2, 4)
    let blackQueen = initQueen(6, 6)
    check canAttack(whiteQueen, blackQueen) == false

  test "can attack on same row":
    let whiteQueen = initQueen(2, 4)
    let blackQueen = initQueen(2, 6)
    check canAttack(whiteQueen, blackQueen) == true

  test "can attack on same column":
    let whiteQueen = initQueen(4, 5)
    let blackQueen = initQueen(2, 5)
    check canAttack(whiteQueen, blackQueen) == true

  test "can attack on first diagonal":
    let whiteQueen = initQueen(2, 2)
    let blackQueen = initQueen(0, 4)
    check canAttack(whiteQueen, blackQueen) == true

  test "can attack on second diagonal":
    let whiteQueen = initQueen(2, 2)
    let blackQueen = initQueen(3, 1)
    check canAttack(whiteQueen, blackQueen) == true

  test "can attack on third diagonal":
    let whiteQueen = initQueen(2, 2)
    let blackQueen = initQueen(1, 1)
    check canAttack(whiteQueen, blackQueen) == true

  test "can attack on fourth diagonal":
    let whiteQueen = initQueen(1, 7)
    let blackQueen = initQueen(0, 6)
    check canAttack(whiteQueen, blackQueen) == true

  # Bonus: graphical board representation
  test "represent a board graphically #1":
    let whiteQueen = initQueen(2, 3)
    let blackQueen = initQueen(5, 6)
    check board(whiteQueen, blackQueen) == "________\n" &
                                           "________\n" &
                                           "___W____\n" &
                                           "________\n" &
                                           "________\n" &
                                           "______B_\n" &
                                           "________\n" &
                                           "________\n"

  test "represent a board graphically #2":
    let whiteQueen = initQueen(0, 6)
    let blackQueen = initQueen(1, 7)
    check board(whiteQueen, blackQueen) == "______W_\n" &
                                           "_______B\n" &
                                           "________\n" &
                                           "________\n" &
                                           "________\n" &
                                           "________\n" &
                                           "________\n" &
                                           "________\n"


  # Bonus: raise an error if queens occupy the same position
  test "queens cannot have the same position (canAttack)":
    let whiteQueen = initQueen(2, 2)
    let blackQueen = initQueen(2, 2)
    expect(ValueError):
      discard canAttack(whiteQueen, blackQueen)

  test "queens cannot have the same position (board)":
    let whiteQueen = initQueen(2, 2)
    let blackQueen = initQueen(2, 2)
    expect(ValueError):
      discard board(whiteQueen, blackQueen)
