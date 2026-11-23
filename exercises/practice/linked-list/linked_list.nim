type
  LinkedList*[T] = object ## A doubly linked list.

proc len*[T](list: LinkedList[T]): int =
  ## Returns the number of nodes in `list`.
  discard

proc push*[T](list: var LinkedList[T], val: T) =
  ## Appends a node with the given `val` to `list`.
  discard

proc pop*[T](list: var LinkedList[T]): T =
  ## Removes the final node of `list` and returns its value.
  discard

proc shift*[T](list: var LinkedList[T]): T =
  ## Removes the first node of `list` and returns its value.
  discard

proc unshift*[T](list: var LinkedList[T], val: T) =
  ## Prepends a node with the given `val` to `list`.
  discard

proc delete*[T](list: var LinkedList[T], val: T) =
  ## Removes a node with value `val` from `list`.
  discard
