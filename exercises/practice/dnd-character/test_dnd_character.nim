import std/[math, unittest]
import dnd_character

suite "D&D Character":
  test "ability modifier for score 3 is -4":
    check modifier(3) == -4

  test "ability modifier for score 4 is -3":
    check modifier(4) == -3

  test "ability modifier for score 5 is -3":
    check modifier(5) == -3

  test "ability modifier for score 6 is -2":
    check modifier(6) == -2

  test "ability modifier for score 7 is -2":
    check modifier(7) == -2

  test "ability modifier for score 8 is -1":
    check modifier(8) == -1

  test "ability modifier for score 9 is -1":
    check modifier(9) == -1

  test "ability modifier for score 10 is 0":
    check modifier(10) == 0

  test "ability modifier for score 11 is 0":
    check modifier(11) == 0

  test "ability modifier for score 12 is +1":
    check modifier(12) == 1

  test "ability modifier for score 13 is +1":
    check modifier(13) == 1

  test "ability modifier for score 14 is +2":
    check modifier(14) == 2

  test "ability modifier for score 15 is +2":
    check modifier(15) == 2

  test "ability modifier for score 16 is +3":
    check modifier(16) == 3

  test "ability modifier for score 17 is +3":
    check modifier(17) == 3

  test "ability modifier for score 18 is +4":
    check modifier(18) == 4

  test "random ability is within range":
    for i in 1..20:
      check ability() in {3..18}

  test "random character is valid":
    for i in 1..20:
      let c = initCharacter()
      check:
        c.strength in {3..18}
        c.dexterity in {3..18}
        c.constitution in {3..18}
        c.intelligence in {3..18}
        c.wisdom in {3..18}
        c.charisma in {3..18}
        c.hitpoints == 10 + modifier(c.constitution)

  test "random ability is distributed correctly":
    type
      AbilityDist = array[3..18, int]

    const
      n = 100
      combinationsCount = 6 * 6 * 6 * 6 # Four six-sided dice.
      numTrials = n * combinationsCount

    func multiply(a: AbilityDist, f: float): AbilityDist =
      for i in a.low .. a.high:
        if f > 1:
          result[i] = (a[i].float * n.float * f).ceil().int
        else:
          result[i] = (a[i].float * n.float * f).floor().int

    # The below `expected` array contains the number of ways to produce each
    # ability score. For example, only 1 of the 1296 dice combinations gives a
    # score of 3 (rolling a 1 on all 4 dice) and so a correct `ability` function
    # should return 3 roughly 1 time per 1296 calls.

    const expected: AbilityDist =
      [1, 4, 10, 21, 38, 62, 91, 122, 148, 167, 172, 160, 131, 94, 54, 21]

    # Generate many ability scores and check that the resulting distribution is
    # sufficiently close to the expected one.

    const
      delta = 0.5
      mins = expected.multiply(1.0 - delta)
      maxs = expected.multiply(1.0 + delta)

    var actual: AbilityDist

    for i in 1 .. numTrials:
      let score = ability()
      inc actual[score]

    for i in actual.low .. actual.high:
      check:
        actual[i] > mins[i]
        actual[i] < maxs[i]
