input_path = Path.expand(Path.relative_to_cwd("../day1_input"))
body = File.read!(input_path)



{:ok, bucket} = Day1.Bucket.start_link([])
Day1.load(bucket, Day1.split(body), 0)
results = Agent.get(bucket, fn content -> content end)
IO.puts("results: #{inspect results}")

totals = for {elf_id, items} <- results, do: {elf_id, Enum.sum(items)}

IO.puts("totals #{inspect totals}")


sorted = Enum.sort_by(totals, fn elf -> case elf do {_, total} -> total end end, :desc)
IO.puts("sorted #{inspect sorted}")
{elf_id, total} = hd(sorted)
IO.puts("Elf ID #{elf_id} collected the most with a total of #{total}")

top_3 = for {_, i} <- Enum.take(sorted, 3), do: i

IO.puts("Top 3 elves #{Enum.sum top_3}")
