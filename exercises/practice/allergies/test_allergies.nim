import
  std / unittest

import
  allergies

suite "testing for eggs allergy":
  test "not allergic to anything":
    check allergicTo("eggs", 0) == false
  test "allergic only to eggs":
    check allergicTo("eggs", 1) == true
  test "allergic to eggs and something else":
    check allergicTo("eggs", 3) == true
  test "allergic to something, but not eggs":
    check allergicTo("eggs", 2) == false
  test "allergic to everything":
    check allergicTo("eggs", 255) == true
suite "testing for peanuts allergy":
  test "not allergic to anything":
    check allergicTo("peanuts", 0) == false
  test "allergic only to peanuts":
    check allergicTo("peanuts", 2) == true
  test "allergic to peanuts and something else":
    check allergicTo("peanuts", 7) == true
  test "allergic to something, but not peanuts":
    check allergicTo("peanuts", 5) == false
  test "allergic to everything":
    check allergicTo("peanuts", 255) == true
suite "testing for shellfish allergy":
  test "not allergic to anything":
    check allergicTo("shellfish", 0) == false
  test "allergic only to shellfish":
    check allergicTo("shellfish", 4) == true
  test "allergic to shellfish and something else":
    check allergicTo("shellfish", 14) == true
  test "allergic to something, but not shellfish":
    check allergicTo("shellfish", 10) == false
  test "allergic to everything":
    check allergicTo("shellfish", 255) == true
suite "testing for strawberries allergy":
  test "not allergic to anything":
    check allergicTo("strawberries", 0) == false
  test "allergic only to strawberries":
    check allergicTo("strawberries", 8) == true
  test "allergic to strawberries and something else":
    check allergicTo("strawberries", 28) == true
  test "allergic to something, but not strawberries":
    check allergicTo("strawberries", 20) == false
  test "allergic to everything":
    check allergicTo("strawberries", 255) == true
suite "testing for tomatoes allergy":
  test "not allergic to anything":
    check allergicTo("tomatoes", 0) == false
  test "allergic only to tomatoes":
    check allergicTo("tomatoes", 16) == true
  test "allergic to tomatoes and something else":
    check allergicTo("tomatoes", 56) == true
  test "allergic to something, but not tomatoes":
    check allergicTo("tomatoes", 40) == false
  test "allergic to everything":
    check allergicTo("tomatoes", 255) == true
suite "testing for chocolate allergy":
  test "not allergic to anything":
    check allergicTo("chocolate", 0) == false
  test "allergic only to chocolate":
    check allergicTo("chocolate", 32) == true
  test "allergic to chocolate and something else":
    check allergicTo("chocolate", 112) == true
  test "allergic to something, but not chocolate":
    check allergicTo("chocolate", 80) == false
  test "allergic to everything":
    check allergicTo("chocolate", 255) == true
suite "testing for pollen allergy":
  test "not allergic to anything":
    check allergicTo("pollen", 0) == false
  test "allergic only to pollen":
    check allergicTo("pollen", 64) == true
  test "allergic to pollen and something else":
    check allergicTo("pollen", 224) == true
  test "allergic to something, but not pollen":
    check allergicTo("pollen", 160) == false
  test "allergic to everything":
    check allergicTo("pollen", 255) == true
suite "testing for cats allergy":
  test "not allergic to anything":
    check allergicTo("cats", 0) == false
  test "allergic only to cats":
    check allergicTo("cats", 128) == true
  test "allergic to cats and something else":
    check allergicTo("cats", 192) == true
  test "allergic to something, but not cats":
    check allergicTo("cats", 64) == false
  test "allergic to everything":
    check allergicTo("cats", 255) == true
suite "list when:":
  test "no allergies":
    check list(0) == newSeq[int]()
  test "just eggs":
    check list(1) == @["eggs"]
  test "just peanuts":
    check list(2) == @["peanuts"]
  test "just strawberries":
    check list(8) == @["strawberries"]
  test "eggs and peanuts":
    check list(3) == @["eggs", "peanuts"]
  test "more than eggs but not peanuts":
    check list(5) == @["eggs", "shellfish"]
  test "lots of stuff":
    check list(248) ==
        @["strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  test "everything":
    check list(255) ==
        @["eggs", "peanuts", "shellfish", "strawberries", "tomatoes",
          "chocolate", "pollen", "cats"]
  test "no allergen score parts":
    check list(509) ==
        @["eggs", "shellfish", "strawberries", "tomatoes", "chocolate",
          "pollen", "cats"]
