import std/[math, random]

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

randomize()

proc ability*: int =
  result = 0
  var lowest = int.high
  for _ in 1..4:
    let roll = rand(1..6)
    result += roll
    lowest = min(lowest, roll)
  result -= lowest

func modifier*(n: int): int =
  (n - 10).floorDiv(2)

proc initCharacter*: Character =
  let constitution = ability()
  Character(
    strength: ability(),
    dexterity: ability(),
    constitution: constitution,
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
    hitpoints: 10 + modifier(constitution),
  )
