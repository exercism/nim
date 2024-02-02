type item = tuple[weight: int, value: int]

proc maximumValue*(maximumWeight: int, items: openArray[item]): int =
    var dp = new_seq[int](maximumWeight + 1)
    for item in items:
        for weight in countdown(maximumWeight, item.weight):
            dp[weight] = max(dp[weight], item.value + dp[weight - item.weight])
    result = dp[maximumWeight]
