import unittest
import allergies

suite "Eggs allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Eggs) == false

  test "allergic only to eggs":
    check isAllergicTo(1, Eggs)

  test "allergic to eggs and something else":
    check isAllergicTo(3, Eggs)

  test "allergic to something, but not eggs":
    check isAllergicTo(2, Eggs) == false

  test "allergic to everything":
    check isAllergicTo(255, Eggs)

suite "Peanuts allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Peanuts) == false

  test "allergic only to peanuts":
    check isAllergicTo(2, Peanuts)

  test "allergic to peanuts and something else":
    check isAllergicTo(7, Peanuts)

  test "allergic to something, but not peanuts":
    check isAllergicTo(5, Peanuts) == false

  test "allergic to everything":
    check isAllergicTo(255, Peanuts)

suite "Shellfish allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Shellfish) == false

  test "allergic only to shellfish":
    check isAllergicTo(4, Shellfish)

  test "allergic to shellfish and something else":
    check isAllergicTo(14, Shellfish)

  test "allergic to something, but not shellfish":
    check isAllergicTo(10, Shellfish) == false

  test "allergic to everything":
    check isAllergicTo(255, Shellfish)

suite "Strawberries allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Strawberries) == false

  test "allergic only to strawberries":
    check isAllergicTo(8, Strawberries)

  test "allergic to strawberries and something else":
    check isAllergicTo(28, Strawberries)

  test "allergic to something, but not strawberries":
    check isAllergicTo(20, Strawberries) == false

  test "allergic to everything":
    check isAllergicTo(255, Strawberries)

suite "Tomatoes allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Tomatoes) == false

  test "allergic only to tomatoes":
    check isAllergicTo(16, Tomatoes)

  test "allergic to tomatoes and something else":
    check isAllergicTo(56, Tomatoes)

  test "allergic to something, but not tomatoes":
    check isAllergicTo(40, Tomatoes) == false

  test "allergic to everything":
    check isAllergicTo(255, Tomatoes)

suite "Chocolate allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Chocolate) == false

  test "allergic only to chocolate":
    check isAllergicTo(32, Chocolate)

  test "allergic to chocolate and something else":
    check isAllergicTo(112, Chocolate)

  test "allergic to something, but not chocolate":
    check isAllergicTo(80, Chocolate) == false

  test "allergic to everything":
    check isAllergicTo(255, Chocolate)

suite "Pollen allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Pollen) == false

  test "allergic only to pollen":
    check isAllergicTo(64, Pollen)

  test "allergic to pollen and something else":
    check isAllergicTo(224, Pollen)

  test "allergic to something, but not pollen":
    check isAllergicTo(160, Pollen) == false

  test "allergic to everything":
    check isAllergicTo(255, Pollen)

suite "Cats allergy":
  test "not allergic to anything":
    check isAllergicTo(0, Cats) == false

  test "allergic only to cats":
    check isAllergicTo(128, Cats)

  test "allergic to cats and something else":
    check isAllergicTo(192, Cats)

  test "allergic to something, but not cats":
    check isAllergicTo(64, Cats) == false

  test "allergic to everything":
    check isAllergicTo(255, Cats)

suite "List the allergies":
  test "no allergies":
    check allergies(0) == {}

  test "just eggs":
    check allergies(1) == {Eggs}

  test "just peanuts":
    check allergies(2) == {Peanuts}

  test "just strawberries":
    check allergies(8) == {Strawberries}

  test "eggs and peanuts":
    check allergies(3) == {Eggs, Peanuts}

  test "more than eggs but not peanuts":
    check allergies(5) == {Eggs, Shellfish}

  test "lots of stuff":
    check allergies(248) == {Strawberries, Tomatoes, Chocolate, Pollen, Cats}

  test "everything":
    check allergies(255) == {Eggs, Peanuts, Shellfish, Strawberries, Tomatoes,
                             Chocolate, Pollen, Cats}

  test "no allergen score parts":
    check allergies(509) == {Eggs, Shellfish, Strawberries, Tomatoes, Chocolate,
                             Pollen, Cats}

  test "no allergen score parts without highest valid score":
    check allergies(257) == {Eggs}
