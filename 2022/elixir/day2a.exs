input_path = Path.expand(Path.relative_to_cwd("../day2_input"))
body = File.read!(input_path)

lines = for x <- String.split(body, "\n"), do: String.trim(x)
matches = Enum.map(lines, fn x -> Day2a.parse_line(x) end)
match_points = for {opponent, player} <- matches, do: Day2a.calculate(opponent, player)
total = Enum.sum(match_points)
IO.puts("Total Points: #{total}")
