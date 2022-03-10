import std/unittest
import lasagna

suite "Lasgna Tests":
  test "expectedMinutesInOven is the right value and exported":
    check expectedMinutesInOven == 40

  test "remainingMinutesInOven":
    check:
      remainingMinutesInOven(30) == 10
      remainingMinutesInOven(0) == 40

  test "preparationTimeInMinutes":
    check:
      preparationTimeInMinutes(6) == 12
      preparationTimeInMinutes(0) == 0

  test "totalTimeInMinutes":
    check:
      totalTimeInMinutes(2, 17) == 21
      totalTimeInMinutes(7, 0) == 14
