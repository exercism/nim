import unittest

import allergies


test "no allergies means not allergic":
    let allergies = Allergies(score: 0)
    check allergies.isAllergicTo("peanuts") == false
    check allergies.isAllergicTo("cats") == false
    check allergies.isAllergicTo("strawberries") == false

test "is allergic to eggs":
    let allergies = Allergies(score: 1)
    check allergies.isAllergicTo("eggs") == true

test "allergic to eggs in addition to other stuff":
    let allergies = Allergies(score: 5)
    check allergies.isAllergicTo("eggs") == true
    check allergies.isAllergicTo("shellfish") == true
    check allergies.isAllergicTo("strawberries") == false

test "no allergies at all":
    let allergies = Allergies(score: 0)
    check allergies.lst == newSeq[string](0)

test "allergic to just eggs":
    let allergies = Allergies(score: 1)
    check allergies.lst == @["eggs"]

test "allergic to just peanuts":
    let allergies = Allergies(score: 2)
    check allergies.lst == @["peanuts"]

test "allergic to just strawberries":
    let allergies = Allergies(score: 8)
    check allergies.lst == @["strawberries"]

test "allergic to eggs and peanuts":
    let allergies = Allergies(score: 3)
    check allergies.lst == @["eggs", "peanuts"]

test "allergic to more than eggs but not peanuts":
    let allergies = Allergies(score: 5)
    check allergies.lst == @["eggs", "shellfish"]

test "allergic to lots of stuff":
    let allergies = Allergies(score: 248)
    check allergies.lst == @[
        "strawberries", "tomatoes", "chocolate", "pollen", "cats"
        ]

test "allergic to everything":
    let allergies = Allergies(score: 255)
    check allergies.lst == @[
            "eggs", "peanuts", "shellfish", "strawberries", "tomatoes",
            "chocolate", "pollen", "cats"
            ]

test "ignore non allergen score parts only eggs":
    let allergies = Allergies(score: 257)
    check allergies.lst == @["eggs"]

test "ignore non allergen score parts":
    let allergies = Allergies(score: 509)
    check allergies.lst == @[
            "eggs", "shellfish", "strawberries", "tomatoes", "chocolate",
            "pollen", "cats"
        ]
