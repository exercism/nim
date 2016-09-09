import unittest

import triangle

test "equilateral triangles have equal sides":
  check kind(2, 2, 2) == tkEquilateral

test "larger equilateral triangles also have equal sides":
  check kind(10, 10, 10) == tkEquilateral

test "isosceles triangles have last two sides equal":
  check kind(3, 4, 4) == tkIsosceles

test "isosceles triangles have first and last sides equal":
  check kind(4, 3, 4) == tkIsosceles

test "isosceles triangles have two first sides equal":
  check kind(4, 4, 3) == tkIsosceles

test "isosceles triangles have in fact exactly two sides equal":
  check kind(10, 10, 2) == tkIsosceles

test "scalene triangles have no equal sides":
  check kind(3, 4, 5) == tkScalene

test "scalene triangles have no equal sides at a larger scale too":
  check kind(10, 11, 12) == tkScalene

test "scalene triangles have no equal sides in descending order either":
  check kind(5, 4, 2) == tkScalene

test "very small triangles are legal":
  check kind(0.4, 0.6, 0.3) == tkScalene

test "triangles with no size are illegal":
  expect(ValueError):
    discard kind(0, 0, 0)

test "triangles with negative sides are illegal":
  expect(ValueError):
    discard kind(3, 4, -5)

test "triangles violating triangle inequality are illegal":
  expect(ValueError):
    discard kind(1, 1, 3)

test "triangles violating triangle inequality are illegal 2":
  expect(ValueError):
    discard kind(2, 4, 2)

test "triangles violating triangle inequality are illegal 3":
  expect(ValueError):
    discard kind(7, 3, 2)

test "triangles with not a number are illegal":
  expect(ValueError):
    discard kind(7, 3, NaN)

test "triangles with infinity are illegal":
  expect(ValueError):
    discard kind(7, 3, Inf)

test "triangles with negative infinity are illegal":
  expect(ValueError):
    discard kind(7, Neginf, 4)
