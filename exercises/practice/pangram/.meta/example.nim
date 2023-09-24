func isPangram*(s: string): bool =
  var seen: array[26, bool] # Faster than array['a'..'z', bool] or set['a'..'z']
  var count = 0
  for c in s:
    let i = if c in {'a'..'z'}: c.ord - 'a'.ord else: c.ord - 'A'.ord
    if i in {0..seen.high} and not seen[i]:
      inc count
      seen[i] = true
  count == seen.len
