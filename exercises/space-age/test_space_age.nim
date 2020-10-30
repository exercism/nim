import unittest
import space_age

suite "Space Age":
  # Helper operator: return true when two floats are approximately equal
  func `~=`(x, y: float): bool =
    abs(x - y) < 0.01

  test "age on Earth":
    check age("Earth", 1_000_000_000) ~= 31.69

  test "age on Mercury":
    check age("Mercury", 2_134_835_688) ~= 280.88

  test "age on Venus":
    check age("Venus", 189_839_836) ~= 9.78

  test "age on Mars":
    check age("Mars", 2_129_871_239) ~= 35.88

  test "age on Jupiter":
    check age("Jupiter", 901_876_382) ~= 2.41

  test "age on Saturn":
    check age("Saturn", 2_000_000_000) ~= 2.15

  test "age on Uranus":
    check age("Uranus", 1_210_123_456) ~= 0.46

  test "age on Neptune":
    check age("Neptune", 1_821_023_456) ~= 0.35

  # Bonus
  test "age that requires int64":
    check age("Saturn", 3_000_000_000) ~= 3.23
