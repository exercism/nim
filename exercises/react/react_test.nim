import unittest
import react

suite "React":
  test "setting the value of an input cell changes the observable value":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
    check i1.value == 1
    i1.value = 2
    check i1.value == 2

  test "the value of a compute is determined by the value of the dependencies":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
      # Using @[Cell i1] to avoid the compiler inferring the array type as seq[InputCell],
      # which is incompatible with seq[Cell].
      c1 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] + 1)
    check c1.value == 2
    i1.value = 2
    check c1.value == 3

  test "compute cells can depend on other compute cells":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
      c1 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] + 1)
      c2 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] - 1)
      c3 = reactor.createCompute(@[Cell c1, c2], proc(vals: seq[int]): int = vals[0] * vals[1])
    check c3.value == 0
    i1.value = 3
    check c3.value == 8

  test "compute cells can have callbacks":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
      c1 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] + 1)
    var observed = newSeq[int]()
    discard c1.addCallback(proc(val: int) = add(observed, val))
    check observed.len == 0
    i1.value = 2
    check observed == @[3]

  proc oneMoreOnAtLeastThree(vals: seq[int]): int =
    if vals[0] > 2: vals[0] + 1 else: 2

  test "callbacks only trigger on change":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
      c1 = reactor.createCompute(@[Cell i1], oneMoreOnAtLeastThree)
    var observerCalled = 0
    discard c1.addCallback(proc(val: int) = inc(observerCalled))
    i1.value = 1
    check observerCalled == 0
    i1.value = 2
    check observerCalled == 0
    i1.value = 3
    check observerCalled == 1

  test "callbacks can be removed":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
      c1 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] + 1)
    var
      observed1 = newSeq[int]()
      observed2 = newSeq[int]()
    let cbRef1 = c1.addCallback(proc(val: int) = add(observed1, val))
    discard c1.addCallback(proc(val: int) = add(observed2, val))
    i1.value = 2
    check observed1 == @[3]
    check observed2 == @[3]
    c1.removeCallback(cbRef1)
    i1.value = 3
    check observed1 == @[3]
    check observed2 == @[3, 4]

  test "callbacks should only be called once even if multiple dependencies have changed":
    let
      reactor = newReactor()
      i1 = reactor.createInput(1)
      c1 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] + 1)
      c2 = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] - 1)
      c3 = reactor.createCompute(@[Cell c2], proc(vals: seq[int]): int = vals[0] - 1)
      c4 = reactor.createCompute(@[Cell c1, c3], proc(vals: seq[int]): int = vals[0] * vals[1])
    var changed4 = 0
    discard c4.addCallback(proc (val: int) = inc(changed4))
    i1.value = 3
    check changed4 == 1

  test "callbacks should not be called if dependencies change in a way that the final value of the compute cell does not change":
    let
      reactor = newReactor()
      i1 = reactor.createInput(0)
      plusOne = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] + 1)
      minusOne = reactor.createCompute(@[Cell i1], proc(vals: seq[int]): int = vals[0] - 1)
      alwaysTwo = reactor.createCompute(@[Cell plusOne, minusOne], proc(vals: seq[int]): int = vals[0] - vals[1])
    var changed = 0
    discard alwaysTwo.addCallback(proc (val: int) = inc(changed))
    for i in 0..10:
      i1.value = i
    check changed == 0
