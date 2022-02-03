import
  std / unittest

import
  atbash_cipher

suite "encode":
  test "encode yes":
    check encode("yes") == "bvh"
  test "encode no":
    check encode("no") == "ml"
  test "encode OMG":
    check encode("OMG") == "lnt"
  test "encode spaces":
    check encode("O M G") == "lnt"
  test "encode mindblowingly":
    check encode("mindblowingly") == "nrmwy oldrm tob"
  test "encode numbers":
    check encode("Testing,1 2 3, testing.") == "gvhgr mt123 gvhgr mt"
  test "encode deep thought":
    check encode("Truth is fiction.") == "gifgs rhurx grlm"
  test "encode all the letters":
    check encode("The quick brown fox jumps over the lazy dog.") ==
        "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
suite "decode":
  test "decode exercism":
    check decode("vcvix rhn") == "exercism"
  test "decode a sentence":
    check decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v") ==
        "anobstacleisoftenasteppingstone"
  test "decode numbers":
    check decode("gvhgr mt123 gvhgr mt") == "testing123testing"
  test "decode all the letters":
    check decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt") ==
        "thequickbrownfoxjumpsoverthelazydog"
  test "decode with too many spaces":
    check decode("vc vix    r hn") == "exercism"
  test "decode with no spaces":
    check decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv") ==
        "anobstacleisoftenasteppingstone"
