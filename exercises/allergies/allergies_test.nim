import unittest
import allergies

suite "Eggs allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("eggs") == false

  test "allergic only to eggs":
    let allergies = Allergies(score: 1)
    check allergies.isAllergicTo("eggs") == true

  test "allergic to eggs and something else":
    let allergies = Allergies(score: 3)
    check allergies.isAllergicTo("eggs") == true

  test "allergic to something, but not eggs":
    let allergies = Allergies(score: 2)
    check allergies.isAllergicTo("eggs") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("eggs") == true

suite "Peanuts allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("peanuts") == false

  test "allergic only to peanuts":
    let allergies = Allergies(score: 2)
    check allergies.isAllergicTo("peanuts") == true

  test "allergic to peanuts and something else":
    let allergies = Allergies(score: 7)
    check allergies.isAllergicTo("peanuts") == true

  test "allergic to something, but not peanuts":
    let allergies = Allergies(score: 5)
    check allergies.isAllergicTo("peanuts") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("peanuts") == true

suite "Shellfish allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("shellfish") == false

  test "allergic only to shellfish":
    let allergies = Allergies(score: 4)
    check allergies.isAllergicTo("shellfish") == true

  test "allergic to shellfish and something else":
    let allergies = Allergies(score: 14)
    check allergies.isAllergicTo("shellfish") == true

  test "allergic to something, but not shellfish":
    let allergies = Allergies(score: 10)
    check allergies.isAllergicTo("shellfish") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("shellfish") == true

suite "Strawberries allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("strawberries") == false

  test "allergic only to strawberries":
    let allergies = Allergies(score: 8)
    check allergies.isAllergicTo("strawberries") == true

  test "allergic to strawberries and something else":
    let allergies = Allergies(score: 28)
    check allergies.isAllergicTo("strawberries") == true

  test "allergic to something, but not strawberries":
    let allergies = Allergies(score: 20)
    check allergies.isAllergicTo("strawberries") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("strawberries") == true

suite "Tomatoes allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("tomatoes") == false

  test "allergic only to tomatoes":
    let allergies = Allergies(score: 16)
    check allergies.isAllergicTo("tomatoes") == true

  test "allergic to tomatoes and something else":
    let allergies = Allergies(score: 56)
    check allergies.isAllergicTo("tomatoes") == true

  test "allergic to something, but not tomatoes":
    let allergies = Allergies(score: 40)
    check allergies.isAllergicTo("tomatoes") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("tomatoes") == true

suite "Chocolate allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("chocolate") == false

  test "allergic only to chocolate":
    let allergies = Allergies(score: 32)
    check allergies.isAllergicTo("chocolate") == true

  test "allergic to chocolate and something else":
    let allergies = Allergies(score: 112)
    check allergies.isAllergicTo("chocolate") == true

  test "allergic to something, but not chocolate":
    let allergies = Allergies(score: 80)
    check allergies.isAllergicTo("chocolate") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("chocolate") == true

suite "Pollen allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("pollen") == false

  test "allergic only to pollen":
    let allergies = Allergies(score: 64)
    check allergies.isAllergicTo("pollen") == true

  test "allergic to pollen and something else":
    let allergies = Allergies(score: 224)
    check allergies.isAllergicTo("pollen") == true

  test "allergic to something, but not pollen":
    let allergies = Allergies(score: 160)
    check allergies.isAllergicTo("pollen") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("pollen") == true

suite "Cats allergy":
  test "not allergic to anything":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("cats") == false

  test "allergic only to cats":
    let allergies = Allergies(score: 128)
    check allergies.isAllergicTo("cats") == true

  test "allergic to cats and something else":
    let allergies = Allergies(score: 192)
    check allergies.isAllergicTo("cats") == true

  test "allergic to something, but not cats":
    let allergies = Allergies(score: 64)
    check allergies.isAllergicTo("cats") == false

  test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.isAllergicTo("cats") == true

suite "List the allergies":
  test "no allergies":
    let allergies = Allergies(score: 0)
    check allergies.lst.len == 0

  test "just eggs":
    let allergies = Allergies(score: 1)
    check allergies.lst == @["eggs"]

  test "just peanuts":
    let allergies = Allergies(score: 2)
    check allergies.lst == @["peanuts"]

  test "just strawberries":
    let allergies = Allergies(score: 8)
    check allergies.lst == @["strawberries"]

  test "eggs and peanuts":
    let allergies = Allergies(score: 3)
    check allergies.lst == @["eggs", "peanuts"]

  test "more than eggs but not peanuts":
    let allergies = Allergies(score: 5)
    check allergies.lst == @["eggs", "shellfish"]

  test "lots of stuff":
    let allergies = Allergies(score: 248)
    check allergies.lst == @["strawberries", "tomatoes", "chocolate",
                             "pollen", "cats"]

  test "everything":
    let allergies = Allergies(score: 255)
    check allergies.lst == @["eggs", "peanuts", "shellfish", "strawberries",
                             "tomatoes", "chocolate", "pollen", "cats"]

  test "no allergen score parts":
    let allergies = Allergies(score: 509)
    check allergies.lst == @["eggs", "shellfish", "strawberries", "tomatoes",
                             "chocolate", "pollen", "cats"]
