import unittest
import anagram

suite "Anagram":
  test "no matches":
    const word = "diaper"
    const candidates = @["hello", "world", "zombies", "pants"]
    check detectAnagrams(word, candidates).len == 0

  test "detects two anagrams":
    const word = "solemn"
    const candidates = @["lemons", "cherry", "melons"]
    check detectAnagrams(word, candidates) == @["lemons", "melons"]

  test "does not detect anagram subsets":
    const word = "good"
    const candidates = @["dog", "goody"]
    check detectAnagrams(word, candidates).len == 0

  test "detects anagram":
    const word = "listen"
    const candidates = @["enlists", "google", "inlets", "banana"]
    check detectAnagrams(word, candidates) == @["inlets"]

  test "detects three anagrams":
    const word = "allergy"
    const candidates = @["gallery", "ballerina", "regally", "clergy", "largely", "leading"]
    check detectAnagrams(word, candidates) == @["gallery", "regally", "largely"]

  test "detects multiple anagrams with different case":
    const word = "nose"
    const candidates = @["Eons", "ONES"]
    check detectAnagrams(word, candidates) == @["Eons", "ONES"]

  test "does not detect non-anagrams with identical checksum":
    const word = "mass"
    const candidates = @["last"]
    check detectAnagrams(word, candidates).len == 0

  test "detects anagrams case-insensitively":
    const word = "Orchestra"
    const candidates = @["cashregister", "Carthorse", "radishes"]
    check detectAnagrams(word, candidates) == @["Carthorse"]

  test "detects anagrams using case-insensitive subject":
    const word = "Orchestra"
    const candidates = @["cashregister", "carthorse", "radishes"]
    check detectAnagrams(word, candidates) == @["carthorse"]

  test "detects anagrams using case-insensitive possible matches":
    const word = "orchestra"
    const candidates = @["cashregister", "Carthorse", "radishes"]
    check detectAnagrams(word, candidates) == @["Carthorse"]

  test "does not detect an anagram if the original word is repeated":
    const word = "go"
    const candidates = @["goGoGO"]
    check detectAnagrams(word, candidates).len == 0

  test "anagrams must use all letters exactly once":
    const word = "tapper"
    const candidates = @["patter"]
    check detectAnagrams(word, candidates).len == 0

  test "words are not anagrams of themselves":
    const word = "BANANA"
    const candidates = @["BANANA"]
    check detectAnagrams(word, candidates).len == 0

  test "words are not anagrams of themselves even if letter case is partially different":
    const word = "BANANA"
    const candidates = @["Banana"]
    check detectAnagrams(word, candidates).len == 0

  test "words are not anagrams of themselves even if letter case is completely different":
    const word = "BANANA"
    const candidates = @["banana"]
    check detectAnagrams(word, candidates).len == 0

  test "words other than themselves can be anagrams":
    const word = "LISTEN"
    const candidates = @["LISTEN", "Silent"]
    check detectAnagrams(word, candidates) == @["Silent"]
