type
  Node[T] = ref object ## A node of a doubly linked list.
    prev: Node[T]
    next: Node[T]
    val: T

  LinkedList*[T] = object ## A doubly linked list.
    head: Node[T]
    tail: Node[T]
    count: int

func len*[T](list: LinkedList[T]): int =
  ## Returns the number of nodes in `list`.
  list.count

proc push*[T](list: var LinkedList[T], val: T) =
  ## Appends a node with the given `val` to `list`.
  let node = Node[T](prev: list.tail, next: nil, val: val)
  if list.tail != nil:
    list.tail.next = node
  list.tail = node
  if list.head == nil:
    list.head = node
  inc list.count

proc unshift*[T](list: var LinkedList[T], val: T) =
  ## Prepends a node with the given `val` to `list`.
  let node = Node[T](prev: nil, next: list.head, val: val)
  if list.head != nil:
    list.head.prev = node
  list.head = node
  if list.tail == nil:
    list.tail = node
  inc list.count

proc pop*[T](list: var LinkedList[T]): T =
  ## Removes the final node of `list` and returns its value.
  if list.tail != nil:
    result = list.tail.val
    list.tail = list.tail.prev
  dec list.count

proc shift*[T](list: var LinkedList[T]): T =
  ## Removes the first node of `list` and returns its value.
  if list.head != nil:
    result = list.head.val
    list.head = list.head.next
  dec list.count

iterator nodes[T](list: LinkedList[T]): Node[T] =
  var node = list.head
  while node != nil:
    yield node
    node = node.next

proc delete*[T](list: var LinkedList[T], val: T) =
  ## Removes a node with value `val` from `list`.
  for node in list.nodes():
    if node.val == val:
      if node.prev == nil:
        list.head = node.next
      else:
        node.prev.next = node.next
      if node.next == nil:
        list.tail = node.prev
      else:
        node.next.prev = node.prev
      dec list.count
      break
