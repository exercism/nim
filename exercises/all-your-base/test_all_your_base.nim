import unittest
import all_your_base

suite "All Your Base":
  test "single bit one to decimal":
    let inputDigits = [1]
    let inputBase = 2
    let outputBase = 10
    let outputDigits = @[1]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "binary to single decimal":
    let inputDigits = [1, 0, 1]
    let inputBase = 2
    let outputBase = 10
    let outputDigits = @[5]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "single decimal to binary":
    let inputDigits = [5]
    let inputBase = 10
    let outputBase = 2
    let outputDigits = @[1, 0, 1]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "binary to multiple decimal":
    let inputDigits = [1, 0, 1, 0, 1, 0]
    let inputBase = 2
    let outputBase = 10
    let outputDigits = @[4, 2]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "decimal to binary":
    let inputDigits = [4, 2]
    let inputBase = 10
    let outputBase = 2
    let outputDigits = @[1, 0, 1, 0, 1, 0]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "trinary to hexadecimal":
    let inputDigits = [1, 1, 2, 0]
    let inputBase = 3
    let outputBase = 16
    let outputDigits = @[2, 10]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "hexadecimal to trinary":
    let inputDigits = [2, 10]
    let inputBase = 16
    let outputBase = 3
    let outputDigits = @[1, 1, 2, 0]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "15-bit integer":
    let inputDigits = [3, 46, 60]
    let inputBase = 97
    let outputBase = 73
    let outputDigits = @[6, 10, 45]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "empty list":
    let inputDigits: array[0, int] = []
    let inputBase = 2
    let outputBase = 10
    let outputDigits = @[0]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "single zero":
    let inputDigits = [0]
    let inputBase = 10
    let outputBase = 2
    let outputDigits = @[0]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "multiple zeros":
    let inputDigits = [0, 0, 0]
    let inputBase = 10
    let outputBase = 2
    let outputDigits = @[0]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "leading zeros":
    let inputDigits = [0, 6, 0]
    let inputBase = 7
    let outputBase = 10
    let outputDigits = @[4, 2]
    check convert(inputDigits, inputBase, outputBase) == outputDigits

  test "input base is one":
    let inputDigits = [0]
    let inputBase = 1
    let outputBase = 10
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "input base is zero":
    let inputDigits: array[0, int] = []
    let inputBase = 0
    let outputBase = 10
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "input base is negative":
    let inputDigits = [1]
    let inputBase = -2
    let outputBase = 10
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "negative digit":
    let inputDigits = [1, -1, 1, 0, 1, 0]
    let inputBase = 2
    let outputBase = 10
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "invalid positive digit":
    let inputDigits = [1, 2, 1, 0, 1, 0]
    let inputBase = 2
    let outputBase = 10
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "output base is one":
    let inputDigits = [1, 0, 1, 0, 1, 0]
    let inputBase = 2
    let outputBase = 1
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "output base is zero":
    let inputDigits = [7]
    let inputBase = 10
    let outputBase = 0
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "output base is negative":
    let inputDigits = [1]
    let inputBase = 2
    let outputBase = -7
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)

  test "both bases are negative":
    let inputDigits = [1]
    let inputBase = -2
    let outputBase = -7
    expect ValueError:
      discard convert(inputDigits, inputBase, outputBase)
