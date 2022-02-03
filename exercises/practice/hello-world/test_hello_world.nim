import
  std / unittest

import
  hello_world

suite "hello-world tests":
  test "Say Hi!":
    check hello() == "Hello, World!"
