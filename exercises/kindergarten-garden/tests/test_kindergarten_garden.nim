import unittest
import kindergarten_garden

suite "Kindergarten Garden":
  test "partial garden: garden with single student":
    const garden = "RC\n" &
                   "GG"
    check plants(garden, "Alice") == @[Radishes, Clover, Grass, Grass]

  test "partial garden: different garden with single student":
    const garden = "VC\n" &
                   "RC"
    check plants(garden, "Alice") == @[Violets, Clover, Radishes, Clover]

  test "partial garden: garden with two students":
    const garden = "VVCG\n" &
                   "VVRC"
    check plants(garden, "Bob") == @[Clover, Grass, Radishes, Clover]


  # Test multiple students for the same 3-student garden.
  const smallGarden = "VVCCGG\n" &
                      "VVCCGG"

  test "partial garden: garden with three students - second student's garden":
    check plants(smallGarden, "Bob") == @[Clover, Clover, Clover, Clover]

  test "partial garden: garden with three students - third student's garden":
    check plants(smallGarden, "Charlie") == @[Grass, Grass, Grass, Grass]


  # Test multiple students for the same 12-student garden.
  const fullGarden = "VRCGVVRVCGGCCGVRGCVCGCGV\n" &
                     "VRCCCGCRRGVCGCRVVCVGCGCV"

  test "full garden: first student's garden":
    check plants(fullGarden, "Alice") == @[Violets, Radishes,
                                           Violets, Radishes]

  test "full garden: second student's garden":
    check plants(fullGarden, "Bob") == @[Clover, Grass, Clover, Clover]

  test "full garden: second to last student's garden":
    check plants(fullGarden, "Kincaid") == @[Grass, Clover, Clover, Grass]

  test "full garden: last student's garden":
    check plants(fullGarden, "Larry") == @[Grass, Violets, Clover, Violets]
