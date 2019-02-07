import unittest
import anagram

# version 1.4.0

suite "Anagram":
  test "no matches":
    let
      word = "diaper"
      candidates = @["hello", "world", "zombies", "pants"]
      expected: seq[string] = @[]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "detects two anagrams":
    let
      word = "master"
      candidates = @["stream", "pigeon", "maters"]
      expected = @["stream", "maters"]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "does not detect anagram subsets":
    let
      word = "good"
      candidates = @["dog", "goody"]
      expected: seq[string] = @[]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "detects anagram":
    let
      word = "listen"
      candidates = @["enlists", "google", "inlets", "banana"]
      expected = @["inlets"]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "detects three anagrams":
    let
      word = "allergy"
      candidates = @["gallery", "ballerina", "regally",
                     "clergy", "largely", "leading"]
      expected = @["gallery", "regally", "largely"]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "does not detect non-anagrams with identical checksum":
    let
      word = "mass"
      candidates = @["last"]
      expected: seq[string] = @[]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "detects anagrams case-insensitively":
    let
      word = "Orchestra"
      candidates = @["cashregister", "Carthorse", "radishes"]
      expected = @["Carthorse"]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "detects anagrams using case-insensitive subject":
    let
      word = "Orchestra"
      candidates = @["cashregister", "carthorse", "radishes"]
      expected = @["carthorse"]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "detects anagrams using case-insensitive possible matches":
    let
      word = "orchestra"
      candidates = @["cashregister", "Carthorse", "radishes"]
      expected = @["Carthorse"]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "does not detect a anagram if the original word is repeated":
    let
      word = "go"
      candidates = @["go Go GO"]
      expected: seq[string] = @[]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "anagrams must use all letters exactly once":
    let
      word = "tapper"
      candidates = @["patter"]
      expected: seq[string] = @[]
      detected = detectAnagrams(word, candidates)
    check detected == expected

  test "words are not anagrams of themselves (case-insensitive)":
    let
      word = "BANANA"
      candidates = @["BANANA", "Banana", "banana"]
      expected: seq[string] = @[]
      detected = detectAnagrams(word, candidates)
    check detected == expected
