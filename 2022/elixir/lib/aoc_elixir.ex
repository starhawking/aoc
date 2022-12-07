defmodule AOC do
  def day(day) do
    input_path = Path.expand(Path.relative_to_cwd("../day#{day}_input"))
    File.stream!(input_path) |> Stream.map(fn x -> String.trim_trailing(x) end)
  end
end
