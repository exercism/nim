import unittest
import react

func firstPlusOne(vals: seq[int]): int =
  vals[0] + 1

func firstMinusOne(vals: seq[int]): int =
  vals[0] - 1

func productOfFirstTwo(vals: seq[int]): int =
  vals[0] * vals[1]

func oneMoreOnAtLeastThree(vals: seq[int]): int =
  if vals[0] > 2: vals[0] + 1 else: 2

func firstMinusSecond(vals: seq[int]): int =
  vals[0] - vals[1]

suite "React":
  test "setting the value of an input cell changes the observable value":
    var
      i1 = newInputCell(1)
    check i1.value == 1
    i1.value = 2
    check i1.value == 2

  test "the value of a compute is determined by the value of the dependencies":
    var
      i1 = newInputCell(1)
      c1 = newComputeCell(@[i1], firstPlusOne)
    check c1.value == 2
    i1.value = 2
    check c1.value == 3

  test "compute cells can depend on other compute cells":
    var
      i1 = newInputCell(1)
      c1 = newComputeCell(@[i1], firstPlusOne)
      c2 = newComputeCell(@[i1], firstMinusOne)
      c3 = newComputeCell(@[c1, c2], productOfFirstTwo)
    check c3.value == 0
    i1.value = 3
    check c3.value == 8

  test "compute cells can have callbacks":
    var
      i1 = newInputCell(1)
      c1 = newComputeCell(@[i1], firstPlusOne)
      observed = newSeq[int]()
    c1.addCallback(proc(val: int) = add(observed, val))
    check observed.len == 0
    i1.value = 2
    check observed == @[3]

  test "callbacks only trigger on change":
    var
      i1 = newInputCell(1)
      c1 = newComputeCell(@[i1], oneMoreOnAtLeastThree)
      observerCalled = 0
    c1.addCallback(proc(val: int) = inc(observerCalled))
    i1.value = 1
    check observerCalled == 0
    i1.value = 2
    check observerCalled == 0
    i1.value = 3
    check observerCalled == 1

  test "callbacks can be removed":
    var
      i1 = newInputCell(1)
      c1 = newComputeCell(@[i1], firstPlusOne)
      observed1 = newSeq[int]()
      observed2 = newSeq[int]()
    let callback = proc(val: int) = add(observed1, val)
    c1.addCallback(callback)
    c1.addCallback(proc(val: int) = add(observed2, val))
    i1.value = 2
    check observed1 == @[3]
    check observed2 == @[3]
    c1.removeCallback(callback)
    i1.value = 3
    check observed1 == @[3]
    check observed2 == @[3, 4]

  test "callbacks should only be called once even if multiple dependencies have changed":
    var
      i1 = newInputCell(1)
      c1 = newComputeCell(@[i1], firstPlusOne)
      c2 = newComputeCell(@[i1], firstMinusOne)
      c3 = newComputeCell(@[c2], firstMinusOne)
      c4 = newComputeCell(@[c1, c3], productOfFirstTwo)
      changed4 = 0
    c4.addCallback(proc (val: int) = inc(changed4))
    i1.value = 3
    check changed4 == 1

  test "callbacks should not be called if dependencies change in a way that " &
       "the final value of the compute cell does not change":
    var
      i1 = newInputCell(0)
      plusOne = newComputeCell(@[i1], firstPlusOne)
      minusOne = newComputeCell(@[i1], firstMinusOne)
      alwaysTwo = newComputeCell(@[plusOne, minusOne], firstMinusSecond)
      changed = 0
    alwaysTwo.addCallback(proc (val: int) = inc(changed))
    for i in 0..10:
      i1.value = i
    check changed == 0
