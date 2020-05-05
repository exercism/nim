import
  algorithm, sequtils, strutils

type TAnagram = tuple
  word: string
  chars: seq[char]  # the lowercased and sorted chars of the word

func isAnagramTo(a, b: TAnagram): bool =
  a.chars == b.chars and cmpIgnoreCase(a.word, b.word) != 0

proc anagram(word: string): TAnagram =
  var chars = toSeq(word.toLowerAscii().items)
  sort(chars, cmp[char])
  (word, chars)

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  ## Returns a sequence of those `candidates` that are anagrams of `word`.
  ##
  ## .. code-block:: nimrod
  ##   assert detectAnagrams("Ant", @["tan", "ant"]) == @["tan"]
  let reference = anagram(word)
  candidates.filterIt(anagram(it).isAnagramTo(reference))
