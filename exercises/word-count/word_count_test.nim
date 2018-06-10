import
  unittest, tables

import word_count

# For each word in the input, count the number of times it appears in the entire sentence.
suite "Word Count":

  test "count one word":
    let
      expected: TableRef[string, int] = {"word": 1}.newTable
      result: TableRef[string, int] = countWords("word")
    check result == expected

  test "count one of each":
    let
      expected = {"one": 1, "of": 1, "each": 1}.newTable
      result = countWords("one of each")
    check result == expected

  test "multiple occurrences of a word":
    let
      expected = {"one": 1, "fish": 4, "two": 1, "red": 1, "blue": 1}.newTable
      result = countWords("one fish two fish red fish blue fish")
    check result == expected

  test "handles cramped lists":
    let
      expected = {"one": 1, "two": 1, "three": 1 }.newTable
      result = countWords("one,two,three")
    check result == expected

  test "handles expanded lists":
    let
      expected = {"one": 1, "two": 1, "three": 1 }.newTable
      result = countWords("one,\ntwo,\nthree")
    check result == expected

  test "ignore punctuation":
    let
      expected = {"car": 1, "carpet": 1, "as": 1, "java": 1, "javascript": 1}.newTable
      result = countWords("car: carpet as java: javascript!!&@$%^&")
    check result == expected
  
  test "include numbers":
    let
      expected = {"testing": 2, "1": 1, "2": 1}.newTable
      result = countWords("testing, 1, 2 testing")
    check result == expected
  
  test "normalize case":
    let
      expected = {"go": 3, "stop": 2}.newTable
      result = countWords("go Go GO Stop stop")
    check result == expected

  test "with apostrophes":
    let
      expected = {"first": 1, "don't": 2, "laugh": 1, "then": 1, "cry": 1}.newTable
      result = countWords("First: don't laugh. Then: don't cry.")
    check result == expected

  test "with quotations":
    let
      expected = {"joe": 1, "can't": 1, "tell": 1,
                  "between": 1, "large": 2, "and": 1}.newTable
      result = countWords("Joe can't tell between 'large' and large.")
    check result == expected

  test "multiple spaces not detected as a word":
    let
      expected = {"multiple": 1, "whitespaces": 1}.newTable
      result = countWords(" multiple   whitespaces")
    check result == expected
