import unittest

import helloworld

suite "Hello World":
  
  test "no name":
    check helloworld() == "Hello, World!"

  test "sample name":
    check helloworld("Alice") == "Hello, Alice!"

  test "other sample name":
    check helloworld("Bob") == "Hello, Bob!"
