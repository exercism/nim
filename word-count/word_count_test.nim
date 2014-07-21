import
 critbits, unittest
import wordcount

proc `==`(a, b: var TWordCount): bool =
  if a.len != b.len:
    return
  for key, count in a:
    if b[key] != count:
      return
  return true

proc fromPairs(pairs: seq[tuple[word: string, count: int]]): TWordCount =
  for p in pairs:
    result[p.word] = p.count

test "count one word":
  let
    expected = fromPairs(@[("word", 1)])
    result = wordCount("word")
  check result == expected

test "count one of each":
  let
    expected = fromPairs(@[("one", 1), ("of", 1), ("each", 1)])
    result = wordCount("one of each")
  check result == expected

test "count multiple occurrences":
  let
    expected = fromPairs(@[("one", 1), ("fish", 4), ("two", 1),
                           ("red", 1), ("blue", 1)])
    result = wordCount("one fish two fish red fish blue fish")
  check result == expected
    
test "ignore punctuation":
  let
    expected = fromPairs(@[("car", 1), ("carpet", 1), ("as", 1),
                           ("java", 1), ("javascript", 1)])
    result = wordCount("car : carpet as java : javascript!!&@$%^&")
  check result == expected
    
test "include numbers":
  let
    expected = fromPairs(@[("testing", 2), ("1", 1), ("2", 1)])
    result = wordCount("testing, 1, 2 testing")
  check result == expected
    
test "normalize case":
  let
    result = wordCount("go Go GO")
    expected = fromPairs(@[("go", 3)])
  check result == expected

test "prefix punctuation":
  let
    expected = fromPairs(@[("testing", 2), ("1", 1), ("2", 1)])
    result = wordCount("!%%#testing, 1, 2 testing")
  check result == expected
    
test "symbols are separators":
  let
    expected = fromPairs(@[("hey", 1), ("my", 1), ("spacebar", 1),
                           ("is", 1), ("broken", 1)])
    result = wordCount("hey,my_spacebar_is_broken.")
  check result == expected
