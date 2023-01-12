type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    val: int

proc newInputCell*(val: int): Cell =
  discard

proc value*(cell: Cell): int =
  discard

proc `value=`*(cell: Cell, val: int) =
  discard

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  discard

proc addCallback*(cell: Cell, callback: Callback) =
  discard

proc removeCallback*(cell: Cell, callback: Callback) =
  discard
