type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc ability*: int =
  discard

proc modifier*(n: int): int =
  discard

proc initCharacter*: Character =
  discard
