import unittest
import kindergarten_garden

suite "Partial garden":
  test "garden with single student":
    const garden = "RC\n" &
                   "GG"
    check plants(garden, "Alice") == @[Radishes, Clover, Grass, Grass]

  test "different garden with single student":
    const garden = "VC\n" &
                   "RC"
    check plants(garden, "Alice") == @[Violets, Clover, Radishes, Clover]

  test "garden with two students":
    const garden = "VVCG\n" &
                   "VVRC"
    check plants(garden, "Bob") == @[Clover, Grass, Radishes, Clover]

suite "Partial garden with 3 students":
  const smallGarden = "VVCCGG\n" &
                      "VVCCGG"

  test "second student's garden":
    check plants(smallGarden, "Bob") == @[Clover, Clover, Clover, Clover]

  test "third student's garden":
    check plants(smallGarden, "Charlie") == @[Grass, Grass, Grass, Grass]

suite "Full garden":
  const fullGarden = "VRCGVVRVCGGCCGVRGCVCGCGV\n" &
                     "VRCCCGCRRGVCGCRVVCVGCGCV"

  test "for Alice, first student's garden":
    check plants(fullGarden, "Alice") == @[Violets, Radishes, Violets, Radishes]

  test "for Bob, second student's garden":
    check plants(fullGarden, "Bob") == @[Clover, Grass, Clover, Clover]

  test "for Charlie":
    check plants(fullGarden, "Charlie") == @[Violets, Violets, Clover, Grass]

  test "for David":
    check plants(fullGarden, "David") == @[Radishes, Violets, Clover, Radishes]

  test "for Eve":
    check plants(fullGarden, "Eve") == @[Clover, Grass, Radishes, Grass]

  test "for Fred":
    check plants(fullGarden, "Fred") == @[Grass, Clover, Violets, Clover]

  test "for Ginny":
    check plants(fullGarden, "Ginny") == @[Clover, Grass, Grass, Clover]

  test "for Harriet":
    check plants(fullGarden, "Harriet") == @[Violets, Radishes, Radishes, Violets]

  test "for Ileana":
    check plants(fullGarden, "Ileana") == @[Grass, Clover, Violets, Clover]

  test "for Joseph":
    check plants(fullGarden, "Joseph") == @[Violets, Clover, Violets, Grass]

  test "for Kincaid, second to last student's garden":
    check plants(fullGarden, "Kincaid") == @[Grass, Clover, Clover, Grass]

  test "for Larry, last student's garden":
    check plants(fullGarden, "Larry") == @[Grass, Violets, Clover, Violets]
