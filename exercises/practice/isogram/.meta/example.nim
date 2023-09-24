func isIsogram*(s: string): bool =
  result = true
  var seen: array[26, bool] # Faster than array['a'..'z', bool] or set['a'..'z']
  for c in s:
    let i = if c in {'a'..'z'}: c.ord - 'a'.ord else: c.ord - 'A'.ord
    if i in {0..seen.high}:
      if seen[i]:
        return false
      seen[i] = true
