from sequtils import map
import tables

type
  Reactor* = ref object of RootObj
    cells: seq[Cell]
    nextCellHandle: int16
  Cell* = ref object of RootObj
    fValue: int
    id: int16
    reactor: Reactor
    consumers: seq[int16]
  InputCell* = ref object of Cell
  ComputeCell* = ref object of Cell
    compute: ComputeFunc
    producers: seq[Cell]
    callbacks: Table[CallbackHandle, CallbackFunc]
    nextCallbackHandle: CallbackHandle
  ComputeFunc* = proc(vals: seq[int]): int
  CallbackHandle* = int
  CallbackFunc* = proc(val: int)

proc newReactor*(): Reactor =
  ## Create a new empty reactor.
  new(result)
  result.cells = @[]

proc trigger(reactor: Reactor, start: Cell) =
  ## Update the values of cells if necessary.
  var needCheck: set[int16] = {}
  for id in start.consumers:
    incl(needCheck, id)
  for id in start.id .. int16(len(reactor.cells)):
    if id in needCheck:
      let
        cell = ComputeCell(reactor.cells[id])
        vals = cell.producers.map(proc(p: Cell): int = p.fValue)
        oldVal = cell.fValue
      cell.fValue = cell.compute(vals)
      if oldVal != cell.fValue:
        for callback in values(cell.callbacks):
          callback(cell.fValue)
        # TODO: Observers
        for consumerHandle in cell.consumers:
          incl(needCheck, consumerHandle)

proc initCell(cell: Cell, reactor: Reactor) =
  ## Setup the common fields of a cell.
  cell.id = reactor.nextCellHandle
  inc(reactor.nextCellHandle)
  add(reactor.cells, cell)
  cell.consumers = @[]
  cell.reactor = reactor

proc createInput*(reactor: Reactor, value: int): InputCell =
  ## Create a new input cell.
  new(result)
  result.initCell(reactor)
  result.fValue = value

proc value*(cell: Cell): int = cell.fValue

proc `value=`*(cell: InputCell, value: int) =
  let oldVal = cell.fValue
  cell.fValue = value
  if oldVal != value:
    cell.reactor.trigger(cell)

proc createCompute*(reactor: Reactor, inputs: seq[Cell], compute: ComputeFunc): ComputeCell =
  ## Create a new compute cell.
  new(result)
  result.initCell(reactor)
  result.compute = compute
  result.producers = inputs
  result.callbacks = initTable[CallbackHandle, CallbackFunc]()
  var vals = newSeq[int](len(inputs))
  for idx, input in inputs:
    vals[idx] = input.value
    add(input.consumers, result.id)
  result.fValue = compute(vals)

proc addCallback*(cell: ComputeCell, callback: CallbackFunc): CallbackHandle =
  cell.callbacks[cell.nextCallbackHandle] = callback
  result = cell.nextCallbackHandle
  inc(cell.nextCallbackHandle)

proc removeCallback*(cell: ComputeCell, callbackHandle: CallbackHandle) =
  del(cell.callbacks, callbackHandle)
