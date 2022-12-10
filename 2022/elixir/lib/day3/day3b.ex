defmodule Day3b do

  def commoner(elems) do
    e = Stream.map(elems, fn x -> to_charlist(x) end)
    Enum.reduce(e, fn x, acc -> Day3a.common(x, acc) end)
  end
end
