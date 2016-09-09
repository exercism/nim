import unittest

import helloworld

test "no name":
  check helloworld() == "Hello, World!"

test "sample name":
  check helloworld("Alice") == "Hello, Alice!"

test "other sample name":
  check helloworld("Bob") == "Hello, Bob!"
