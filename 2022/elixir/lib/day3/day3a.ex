defmodule Day3a do
  def split(raw) do
    # We are just assuming everything is an evenly divisible length
    # the phrasing of the problem makes this seem like a safe assumption
    pivot = round(String.length(raw) / 2)
    {l, r} = String.split_at(raw, pivot)
    {to_charlist(l), to_charlist(r)}
  end

  def common(left, right) do
    intersection = MapSet.intersection(MapSet.new(left), MapSet.new(right))
    MapSet.to_list(intersection)
  end

  def item_priority([item]) when ?a <= item and item <= ?z do
    item - ?a + 1
  end

  def item_priority([item]) when ?A <= item and item <= ?Z do
    item - ?A + 27
  end

  def prioritize(bag) do
    {bag_l, bag_r} = split(bag)
    item_priority(common(bag_l, bag_r))
  end
end
