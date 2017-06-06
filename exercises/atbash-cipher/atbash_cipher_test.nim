import tables
import unittest
import atbash_cipher

test "encode 'no'":
  check encode("no") == "ml"

test "encode 'yes'":
  check encode("yes") == "bvh"

test "encode 'OMG'":
  check encode("OMG") == "lnt"

test "encode 'O M G'":
  check encode("O M G") == "lnt"

test "encode 'mindblowingly'":
  check encode("mindblowingly") == "nrmwy oldrm tob"

test "encode 'Testing, 1 2 3, testing.'":
  check encode("Testing, 1 2 3, testing.") == "gvhgr mt123 gvhgr mt"

test "encode 'Truth is fiction.'":
  check encode("Truth is fiction.") == "gifgs rhurx grlm"

test "encode 'The quick brown fox jumps over the lazy dog.'":
  check encode("The quick brown fox jumps over the lazy dog.") == "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
