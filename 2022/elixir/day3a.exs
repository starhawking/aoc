total = Enum.sum(
  AOC.day(3)
    |> Stream.map(fn x -> Day3a.prioritize(x) end)
)

IO.puts("Total #{total}")
