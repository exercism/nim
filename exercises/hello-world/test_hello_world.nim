import unittest
import hello_world

suite "Hello World":
  test "say hi!":
    check hello() == "Hello, World!"
