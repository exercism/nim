func binarySearch*[T](a: openArray[T], val: T): int =
  ## Searches `a` for the given `val`, and returns its index (or -1 if not found).
  var left = 0
  var right = a.len

  while left < right:
    let mid = left + ((right - left) shr 1) # Avoid overflow.
    let c = cmp(a[mid], val)
    if c == 0:
      return mid
    if c < 0:
      left = mid + 1
    else:
      right = mid

  return -1
