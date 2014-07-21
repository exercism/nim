import unittest
from anagram import detectAnagrams

test "no matches":
  let
    word = "diaper"
    candidates = @["hello", "world", "zombies", "pants"]
    expected: seq[string] = @[]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "detect simple anagram":
  let
    word = "ant"
    candidates = @["tan", "stand", "at"]
    expected = @["tan"]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "detect multiple anagrams":
  let
    word = "master"
    candidates = @["stream", "pigeon", "maters"]
    expected = @["stream", "maters"]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "does not confuse different duplicate characters":
  let
    word = "galea"
    candidates = @["eagle"]
    expected: seq[string] = @[]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "eliminate anagram subsets":
  let
    word = "good"
    candidates = @["dog", "goody"]
    expected: seq[string] = @[]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "detect anagram":
  let
    word = "listen"
    candidates = @["enlists", "google", "inlets", "banana"]
    expected = @["inlets"]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "multiple anagrams":
  let
    word = "allergy"
    candidates = @["gallery", "ballerina", "regally", "clergy", "largely", "leading"]
    expected = @["gallery", "regally", "largely"]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "anagrams are case insensitive":
  let
    word = "Orchestra"
    candidates = @["cashregister", "Carthorse", "radishes"]
    expected = @["Carthorse"]
    detected = detectAnagrams(word, candidates)
  check detected == expected

test "same word isn't anagram":
  let
    word = "go"
    candidates = @["go", "Go", "GO"]
    expected: seq[string] = @[]
    detected = detectAnagrams(word, candidates)
  check detected == expected
