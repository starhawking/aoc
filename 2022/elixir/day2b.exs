
require Day2b.Score
require Day2b.Game
stream = AOC.day(2)
  |> Stream.map(fn x -> Day2b.parse_line(x) end)
  |> Stream.map(fn {opponent, outcome} -> Day2b.Score.points(Day2b.Game.desired(opponent, outcome), outcome) end)
total = Enum.sum(stream)
IO.puts("Total Points: #{total}")
