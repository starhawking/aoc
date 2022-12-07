defmodule Day3a do
  def split(raw) do
    # We are just assuming everything is an evenly divisible length
    # the phrasing of the problem makes this seem like a safe assumption
    pivot = round(String.length(raw) / 2)
    String.split_at(raw, pivot)
  end
end
