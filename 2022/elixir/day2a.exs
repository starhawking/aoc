stream = AOC.day(2)
  |> Stream.map(fn x -> Day2a.parse_line(x) end)
  |> Stream.map(fn {opponent, player} -> Day2a.calculate(opponent, player) end)
total = Enum.sum(stream)
IO.puts("Total Points: #{total}")
