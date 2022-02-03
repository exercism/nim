import
  std / unittest

import
  anagram

suite "anagram tests":
  test "no matches":
    check findAnagrams("diaper", @["hello", "world", "zombies", "pants"]) ==
        newSeq[int]()
  test "detects two anagrams":
    check findAnagrams("master", @["stream", "pigeon", "maters"]) ==
        @["stream", "maters"]
  test "detects two anagrams":
    check findAnagrams("solemn", @["lemons", "cherry", "melons"]) ==
        @["lemons", "melons"]
  test "does not detect anagram subsets":
    check findAnagrams("good", @["dog", "goody"]) == newSeq[int]()
  test "detects anagram":
    check findAnagrams("listen", @["enlists", "google", "inlets", "banana"]) ==
        @["inlets"]
  test "detects three anagrams":
    check findAnagrams("allergy", @["gallery", "ballerina", "regally", "clergy",
                                    "largely", "leading"]) ==
        @["gallery", "regally", "largely"]
  test "detects multiple anagrams with different case":
    check findAnagrams("nose", @["Eons", "ONES"]) == @["Eons", "ONES"]
  test "does not detect non-anagrams with identical checksum":
    check findAnagrams("mass", @["last"]) == newSeq[int]()
  test "detects anagrams case-insensitively":
    check findAnagrams("Orchestra", @["cashregister", "Carthorse", "radishes"]) ==
        @["Carthorse"]
  test "detects anagrams using case-insensitive subject":
    check findAnagrams("Orchestra", @["cashregister", "carthorse", "radishes"]) ==
        @["carthorse"]
  test "detects anagrams using case-insensitive possible matches":
    check findAnagrams("orchestra", @["cashregister", "Carthorse", "radishes"]) ==
        @["Carthorse"]
  test "does not detect an anagram if the original word is repeated":
    check findAnagrams("go", @["go Go GO"]) == newSeq[int]()
  test "anagrams must use all letters exactly once":
    check findAnagrams("tapper", @["patter"]) == newSeq[int]()
  test "words are not anagrams of themselves (case-insensitive)":
    check findAnagrams("BANANA", @["BANANA", "Banana", "banana"]) ==
        newSeq[int]()
  test "words other than themselves can be anagrams":
    check findAnagrams("LISTEN", @["Listen", "Silent", "LISTEN"]) ==
        @["Silent"]
