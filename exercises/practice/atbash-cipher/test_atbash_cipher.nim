import unittest
import atbash_cipher

# The tests are divided into two groups:
# Encoding from English to atbash cipher
# Decoding from atbash cipher to all-lowercase-mashed-together English

suite "Encode":
  test "encode yes":
    let phrase = "yes"
    let expected = "bvh"
    check encode(phrase) == expected

  test "encode no":
    let phrase = "no"
    let expected = "ml"
    check encode(phrase) == expected

  test "encode OMG":
    let phrase = "OMG"
    let expected = "lnt"
    check encode(phrase) == expected

  test "encode spaces":
    let phrase = "O M G"
    let expected = "lnt"
    check encode(phrase) == expected

  test "encode mindblowingly":
    let phrase = "mindblowingly"
    let expected = "nrmwy oldrm tob"
    check encode(phrase) == expected

  test "encode numbers":
    let phrase = "Testing,1 2 3, testing."
    let expected = "gvhgr mt123 gvhgr mt"
    check encode(phrase) == expected

  test "encode deep thought":
    let phrase = "Truth is fiction."
    let expected = "gifgs rhurx grlm"
    check encode(phrase) == expected

  test "encode all the letters":
    let phrase = "The quick brown fox jumps over the lazy dog."
    let expected = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    check encode(phrase) == expected


suite "Decode":
  test "decode exercism":
    let phrase = "vcvix rhn"
    let expected = "exercism"
    check decode(phrase) == expected

  test "decode a sentence":
    let phrase = "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
    let expected = "anobstacleisoftenasteppingstone"
    check decode(phrase) == expected

  test "decode numbers":
    let phrase = "gvhgr mt123 gvhgr mt"
    let expected = "testing123testing"
    check decode(phrase) == expected

  test "decode all the letters":
    let phrase = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    let expected = "thequickbrownfoxjumpsoverthelazydog"
    check decode(phrase) == expected

  test "decode with too many spaces":
    let phrase = "vc vix    r hn"
    let expected = "exercism"
    check decode(phrase) == expected

  test "decode with no spaces":
    let phrase = "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
    let expected = "anobstacleisoftenasteppingstone"
    check decode(phrase) == expected
