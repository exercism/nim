import unittest
import knapsack

suite "knapsack":
  test "no items":
    let maximumWeight = 100
    let items: array[0, tuple[weight: int, value: int]] = []
    let expected = 0
    check maximumValue(maximumWeight, items) == expected

  test "one item, too heavy":
    let maximumWeight = 10
    let items = [(weight: 100, value: 1)]
    let expected = 0
    check maximumValue(maximumWeight, items) == expected

  test "five items (cannot be greedy by weight)":
    let maximumWeight = 10
    let items = [
        (weight: 2, value: 5), (weight: 2, value: 5), (weight: 2, value: 5),
        (weight: 2, value: 5), (weight: 10, value: 21)
        ]
    let expected = 21
    check maximumValue(maximumWeight, items) == expected

  test "five items (cannot be greedy by value)":
    let maximumWeight = 10
    let items = [
        (weight: 2, value: 20), (weight: 2, value: 20), (weight: 2, value: 20),
        (weight: 2, value: 20), (weight: 10, value: 50)
        ]
    let expected = 80
    check maximumValue(maximumWeight, items) == expected

  test "example knapsack":
    let maximumWeight = 10
    let items = [
        (weight: 5, value: 10), (weight: 4, value: 40), (weight: 6, value: 30),
        (weight: 4, value: 50)
        ]
    let expected = 90
    check maximumValue(maximumWeight, items) == expected

  test "8 items":
    let maximumWeight = 104
    let items = [
        (weight: 25, value: 350), (weight: 35, value: 400), (weight: 45, value: 450),
        (weight: 5, value: 20), (weight: 25, value: 70), (weight: 3, value: 8),
        (weight: 2, value: 5), (weight: 2, value: 5)
        ]
    let expected = 900
    check maximumValue(maximumWeight, items) == expected

  test "15 items":
    let maximumWeight = 750
    let items = [
        (weight: 70, value: 135), (weight: 73, value: 139), (weight: 77, value: 149),
        (weight: 80, value: 150), (weight: 82, value: 156), (weight: 87, value: 163),
        (weight: 90, value: 173), (weight: 94, value: 184), (weight: 98, value: 192),
        (weight: 106, value: 201), (weight: 110, value: 210), (weight: 113, value: 214),
        (weight: 115, value: 221), (weight: 118, value: 229), (weight: 120, value: 240)
        ]
    let expected = 1458
    check maximumValue(maximumWeight, items) == expected
