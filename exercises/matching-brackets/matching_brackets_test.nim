import unittest
import matching_brackets

suite "Matching Brackets":
  test "paired square brackets":
    check isPaired("[]") == true

  test "empty string":
    check isPaired("") == true

  test "unpaired brackets":
    check isPaired("[[") == false

  test "wrong ordered brackets":
    check isPaired("}{") == false

  test "wrong closing bracket":
    check isPaired("{]") == false

  test "paired with whitespace":
    check isPaired("{ }") == true

  test "partially paired brackets":
    check isPaired("{[])") == false

  test "simple nested brackets":
    check isPaired("{[]}") == true

  test "several paired brackets":
    check isPaired("{}[]") == true

  test "paired and nested brackets":
    check isPaired("([{}({}[])])") == true

  test "unopened closing brackets":
    check isPaired("{[)][]}") == false

  test "unpaired and nested brackets":
    check isPaired("([{])") == false

  test "paired and wrong nested brackets":
    check isPaired("[({]})") == false

  test "paired and incomplete brackets":
    check isPaired("{}[") == false

  test "too many closing brackets":
    check isPaired("[]]") == false

  test "math expression":
    check isPaired("(((185 + 223.85) * 15) - 543)/2") == true

  test "complex latex expression":
    let value = "\\left(\\begin{array}{cc} \\frac{1}{3} & x" &
                "\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
    check isPaired(value) == true
