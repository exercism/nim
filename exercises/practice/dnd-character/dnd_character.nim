type
  Character* = object
    strength*: int

proc ability*: int =
  discard

proc modifier*(n: int): int =
  discard

proc initCharacter*: Character =
  discard
