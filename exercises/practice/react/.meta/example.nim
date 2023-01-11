import std/sets

type
  CellKind = enum
    ckInput, ckCompute

  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    val: int
    consumers: seq[Cell] # Cells that are downstream of this cell.
    case kind: CellKind
    of ckInput:
      discard
    of ckCompute:
      dependencies: seq[Cell] # Cells that are upstream of this cell.
      compute: ComputeFunc
      callbacks: HashSet[Callback]

func newInputCell*(val: int): Cell =
  Cell(kind: ckInput, val: val)

func value*(cell: Cell): int =
  case cell.kind
  of ckInput:
    cell.val
  of ckCompute:
    var values = newSeq[int](cell.dependencies.len)
    for i, v in values.mpairs:
      v = cell.dependencies[i].value()
    cell.compute(values)

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  result = Cell(consumers: @[], kind: ckCompute, dependencies: dependencies,
                compute: compute, callbacks: initHashSet[Callback](4))
  result.val = result.value()
  for dependency in dependencies:
    dependency.consumers.add result

proc `value=`*(cell: Cell, val: int) =
  if val != cell.val:
    cell.val = val
    if cell.kind == ckCompute:
      for callback in cell.callbacks:
        callback(cell.val)
    for consumer in cell.consumers.mitems:
      consumer.value = consumer.value()

proc addCallback*(cell: Cell, callback: Callback) =
  cell.callbacks.incl callback

proc removeCallback*(cell: Cell, callback: Callback) =
  cell.callbacks.excl callback
