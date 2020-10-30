import unittest
import binary

suite "Binary":
  test "binary 0 is decimal 0":
    check binary("0") == 0

  test "binary 1 is decimal 1":
    check binary("1") == 1

  test "binary 10 is decimal 2":
    check binary("10") == 2

  test "binary 11 is decimal 3":
    check binary("11") == 3

  test "binary 100 is decimal 4":
    check binary("100") == 4

  test "binary 1001 is decimal 9":
    check binary("1001") == 9

  test "binary 11010 is decimal 26":
    check binary("11010") == 26

  test "binary 10001101000 is decimal 1128":
    check binary("10001101000") == 1128

  test "binary ignores leading zeros":
    check binary("000011111") == 31

  test "2 is not a valid binary digit":
    expect(ValueError):
      discard binary("2")

  test "a number containing a non-binary digit is invalid":
    expect(ValueError):
      discard binary("01201")

  test "a number with trailing non-binary characters is invalid":
    expect(ValueError):
      discard binary("10nope")

  test "a number with leading non-binary characters is invalid":
    expect(ValueError):
      discard binary("nope10")

  test "a number with internal non-binary characters is invalid":
    expect(ValueError):
      discard binary("10nope10")

  test "a number and a word whitespace separated is invalid":
    expect(ValueError):
      discard binary("001 nope")
