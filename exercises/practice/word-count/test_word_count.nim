import unittest, tables
import word_count

suite "Word Count":
  test "count one word":
    let output = countWords("word")
    check:
      output.len == 1
      output["word"] == 1

  test "count one of each word":
    let output = countWords("one of each")
    check:
      output.len == 3
      output["one"] == 1
      output["of"] == 1
      output["each"] == 1

  test "multiple occurrences of a word":
    let output = countWords("one fish two fish red fish blue fish")
    check:
      output.len == 5
      output["one"] == 1
      output["fish"] == 4
      output["two"] == 1
      output["red"] == 1
      output["blue"] == 1

  test "handles cramped lists":
    let output = countWords("one,two,three")
    check:
      output.len == 3
      output["one"] == 1
      output["two"] == 1
      output["three"] == 1

  test "handles expanded lists":
    let output = countWords("one,\ntwo,\nthree")
    check:
      output.len == 3
      output["one"] == 1
      output["two"] == 1
      output["three"] == 1

  test "ignore punctuation":
    let output = countWords("car: carpet as java: javascript!!&@$%^&")
    check:
      output.len == 5
      output["car"] == 1
      output["carpet"] == 1
      output["as"] == 1
      output["java"] == 1
      output["javascript"] == 1

  test "include numbers":
    let output = countWords("testing, 1, 2 testing")
    check:
      output.len == 3
      output["testing"] == 2
      output["1"] == 1
      output["2"] == 1

  test "normalize case":
    let output = countWords("go Go GO Stop stop")
    check:
      output.len == 2
      output["go"] == 3
      output["stop"] == 2

  test "with apostrophes":
    let output = countWords("First: don't laugh. Then: don't cry.")
    check:
      output.len == 5
      output["first"] == 1
      output["don't"] == 2
      output["laugh"] == 1
      output["then"] == 1
      output["cry"] == 1

  test "with quotations":
    let output = countWords("Joe can't tell between 'large' and large.")
    check:
      output.len == 6
      output["joe"] == 1
      output["can't"] == 1
      output["tell"] == 1
      output["between"] == 1
      output["large"] == 2
      output["and"] == 1

  test "substrings from the beginning":
    let output = countWords("Joe can't tell between app, apple and a.")
    check:
      output.len == 8
      output["joe"] == 1
      output["can't"] == 1
      output["tell"] == 1
      output["between"] == 1
      output["app"] == 1
      output["apple"] == 1
      output["and"] == 1
      output["a"] == 1

  test "multiple spaces not detected as a word":
    let output = countWords(" multiple   whitespaces")
    check:
      output.len == 2
      output["multiple"] == 1
      output["whitespaces"] == 1

  test "alternating word separators not detected as a word":
    let output = countWords(",\n,one,\n ,two \n 'three'")
    check:
      output.len == 3
      output["one"] == 1
      output["two"] == 1
      output["three"] == 1
