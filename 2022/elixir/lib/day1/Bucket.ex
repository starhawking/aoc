defmodule Day1.Bucket do
  use Agent

  @doc """
  Collects entries for a given key
  """


  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  def collect(bucket, key, value) do
    Agent.update(bucket, &Map.update(&1, key, [value], fn values -> values ++ [value] end))
  end

end
