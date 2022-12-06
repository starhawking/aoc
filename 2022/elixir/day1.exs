{:ok, bucket} = Day1.Bucket.start_link([])
Day1.load(bucket, Day1.lines, 0)
results = Agent.get(bucket, fn content -> content end)
IO.puts("results: #{inspect results}")
