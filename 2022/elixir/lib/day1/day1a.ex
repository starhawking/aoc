defmodule Day1 do
  alias Day1.Bucket

  @input """
  1000
  2000
  3000
  
  4000
  
  5000
  6000
  
  7000
  8000
  9000
  
  10000
  """

  def lines do
    for x <- String.split(@input, "\n"), do: String.trim_trailing(x)
  end

  def load(bucket, [head | tail], elf_id) do
    case head do
      "" ->
        load(bucket, tail, elf_id + 1)

      body ->
        Bucket.collect(bucket, elf_id, body)
        load(bucket, tail, elf_id)
    end
  end

  def load(_bucket, [], _elf_id) do
    IO.puts("Done Loading")
  end
end
