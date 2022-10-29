type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    val: int

proc newInputCell*(val: int): Cell =
  discard

proc value*(cell: var Cell): int =
  discard

proc `value=`*(cell: var Cell, val: int) =
  discard

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  discard

proc addCallback*(cell: var Cell, callback: Callback) =
  discard

proc removeCallback*(cell: var Cell, callback: Callback) =
  discard
