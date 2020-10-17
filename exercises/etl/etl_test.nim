import unittest, tables
import etl

suite "ETL":
  test "single letter":
    const input = {
      1: @['A']
    }.toTable
    let output = transform(input)
    check:
      output.len == 1
      output['a'] == 1

  test "single score with multiple letters":
    const input = {
      1: @['A', 'E', 'I', 'O', 'U']
    }.toTable
    let output = transform(input)
    check:
      output.len == 5
      output['a'] == 1
      output['e'] == 1
      output['i'] == 1
      output['o'] == 1
      output['u'] == 1

  test "multiple scores with multiple letters":
    const input = {
      1: @['A', 'E'],
      2: @['D', 'G']
    }.toTable
    let output = transform(input)
    check:
      output.len == 4
      output['a'] == 1
      output['d'] == 2
      output['e'] == 1
      output['g'] == 2

  test "multiple scores with differing numbers of letters":
    const input = {
      1: @['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
      2: @['D', 'G'],
      3: @['B', 'C', 'M', 'P'],
      4: @['F', 'H', 'V', 'W', 'Y'],
      5: @['K'],
      8: @['J', 'X'],
      10: @['Q', 'Z']
    }.toTable
    let output = transform(input)
    check:
      output.len == 26
      output['a'] == 1
      output['b'] == 3
      output['c'] == 3
      output['d'] == 2
      output['e'] == 1
      output['f'] == 4
      output['g'] == 2
      output['h'] == 4
      output['i'] == 1
      output['j'] == 8
      output['k'] == 5
      output['l'] == 1
      output['m'] == 3
      output['n'] == 1
      output['o'] == 1
      output['p'] == 3
      output['q'] == 10
      output['r'] == 1
      output['s'] == 1
      output['t'] == 1
      output['u'] == 1
      output['v'] == 4
      output['w'] == 4
      output['x'] == 8
      output['y'] == 4
      output['z'] == 10
