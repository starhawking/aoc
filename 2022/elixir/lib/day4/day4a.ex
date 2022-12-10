defmodule Day4a do
  def parse_range(range) do
    [start, stop] = String.split(range, "-")
    Range.new(String.to_integer(start), String.to_integer(stop))
  end

  def parse(raw) do
    [elf_a, elf_b] = String.split(raw, ",")
    l = parse_range(elf_a)
    r = parse_range(elf_b)
    {l,r}
  end

  def fully_contained?(group_a, group_b) do
    set_a = MapSet.new(group_a)
    set_b = MapSet.new(group_b)
    MapSet.subset?(set_a, set_b) or MapSet.subset?(set_b, set_a)
  end

  def overlaps?(group_a, group_b) do
    overlap = MapSet.intersection(MapSet.new(group_a), MapSet.new(group_b))
    MapSet.size(overlap) > 0
  end

end
