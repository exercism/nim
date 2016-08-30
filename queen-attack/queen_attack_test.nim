import unittest

import queen_attack

const answer1 = @["________",
                  "________",
                  "___W____",
                  "________",
                  "________",
                  "______B_",
                  "________",
                  "________"]

test "board1":
  check board((2, 3), (5, 6)) == answer1

const answer2 = @["______W_",
                  "_______B",
                  "________",
                  "________",
                  "________",
                  "________",
                  "________",
                  "________"]

test "board2":
  check board((0, 6), (1, 7)) == answer2

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

test "invalid position on board":
  expect(ValueError):
    discard board((0, 0), (7, 8))

test "invalid position in canAttack":
  expect(ValueError):
    discard canAttack((0, 0), (7, 8))

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

test "invalid position on board":
  expect(ValueError):
    discard board((0, 0), (7, 8))

test "queens in same position on board":
  expect(ValueError):
    discard board((2, 2), (2, 2))

test "queens in same position in canAttack":
  expect(ValueError):
    discard canAttack((2, 2), (2, 2))
