import unittest
import phone_number

suite "Phone Number":
  test "cleans the number":
    check clean("(223) 456-7890") == "2234567890"

  test "cleans numbers with dots":
    check clean("223.456.7890") == "2234567890"

  test "cleans numbers with multiple spaces":
    check clean("223 456   7890   ") == "2234567890"

  test "invalid when 9 digits":
    expect ValueError:
      discard clean("123456789")

  test "invalid when 11 digits does not start with a 1":
    expect ValueError:
      discard clean("22234567890")

  test "valid when 11 digits and starting with 1":
    check clean("12234567890") == "2234567890"

  test "valid when 11 digits and starting with 1 even with punctuation":
    check clean("+1 (223) 456-7890") == "2234567890"

  test "invalid when more than 11 digits":
    expect ValueError:
      discard clean("321234567890")

  test "invalid with letters":
    expect ValueError:
      discard clean("123-abc-7890")

  test "invalid with punctuations":
    expect ValueError:
      discard clean("123-@:!-7890")

  test "invalid if area code starts with 0":
    expect ValueError:
      discard clean("(023) 456-7890")

  test "invalid if area code starts with 1":
    expect ValueError:
      discard clean("(123) 456-7890")

  test "invalid if exchange code starts with 0":
    expect ValueError:
      discard clean("(223) 056-7890")

  test "invalid if exchange code starts with 1":
    expect ValueError:
      discard clean("(223) 156-7890")

  test "invalid if area code starts with 0 on valid 11-digit number":
    expect ValueError:
      discard clean("1 (023) 456-7890")

  test "invalid if area code starts with 1 on valid 11-digit number":
    expect ValueError:
      discard clean("1 (123) 456-7890")

  test "invalid if exchange code starts with 0 on valid 11-digit number":
    expect ValueError:
      discard clean("1 (223) 056-7890")

  test "invalid if exchange code starts with 1 on valid 11-digit number":
    expect ValueError:
      discard clean("1 (223) 156-7890")
