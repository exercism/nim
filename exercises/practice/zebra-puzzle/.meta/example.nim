# Adapted from: https://rosettacode.org/wiki/Zebra_puzzle#Nim

import std/[algorithm, sequtils]

type
  Nationality* = enum
    Englishman, Spaniard, Ukranian, Japanese, Norwegian

  Color = enum
    Red, Green, Ivory, Yellow, Blue

  Pet = enum
    Dog, Snails, Fox, Horse, Zebra

  Drink = enum
    Coffee, Tea, Milk, OrangeJuice, Water

  Smoke = enum
    OldGold, Kools, Chesterfields, LuckyStrike, Parliaments

  House = tuple[color: Color, nationality: Nationality, pet: Pet, drink: Drink, smoke: Smoke]

  Solution = array[5, House]

iterator permutations[T]: array[5, T] =
  var term = [T(0), T(1), T(2), T(3), T(4)]
  yield term
  while term.nextPermutation():
    yield term

proc solve: Solution =
  for colors in permutations[Color]():
    if colors.find(Ivory) != colors.find(Green) + 1: continue
    for nationalities in permutations[Nationality]():
      if nationalities[0] != Norwegian: continue
      if colors.find(Red) != nationalities.find(Englishman): continue
      if abs(nationalities.find(Norwegian) - colors.find(Blue)) != 1: continue
      for pets in permutations[Pet]():
        if nationalities.find(Spaniard) != pets.find(Dog): continue
        for drinks in permutations[Drink]():
          if drinks[2] != Milk: continue
          if nationalities.find(Ukranian) != drinks.find(Tea): continue
          if colors.find(Green) != drinks.find(Coffee): continue
          for cigarettes in permutations[Smoke]():
            if cigarettes.find(OldGold) != pets.find(Snails): continue
            if cigarettes.find(Kools) != colors.find(Yellow): continue
            if cigarettes.find(LuckyStrike) != drinks.find(OrangeJuice): continue
            if cigarettes.find(Parliaments) != nationalities.find(Japanese): continue
            if abs(cigarettes.find(Chesterfields) - pets.find(Fox)) != 1: continue
            if abs(cigarettes.find(Kools) - pets.find(Horse)) != 1: continue
            for i in result.low..result.high:
              result[i] = (colors[i], nationalities[i], pets[i], drinks[i], cigarettes[i])
            return result

# Calculate solution at compile-time
const solution = solve()

proc waterDrunkBy*: Nationality =
  solution.filterIt(it.drink == Water)[0].nationality

proc zebraOwnedBy*: Nationality =
  solution.filterIt(it.pet == Zebra)[0].nationality
