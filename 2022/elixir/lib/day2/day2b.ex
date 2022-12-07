defmodule Day2b do
  def parse(code) do
    case code do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
      "X" -> :loose
      "Y" -> :tie
      "Z" -> :win
    end
  end

  def parse_line("") do
  end

  def parse_line(line) do
    [opponent, player] = String.split(line)
    {parse(opponent), parse(player)}
  end
end

defmodule Day2b.Game do
  def desired(opponent, :tie) do
    opponent
  end

  def desired(:rock, result) do
    case result do
      :win -> :paper
      :loose -> :scissors
    end
  end

  def desired(:paper, result) do
    case result do
      :win -> :scissors
      :loose -> :rock
    end
  end

  def desired(:scissors, result) do
    case result do
      :win -> :rock
      :loose -> :paper
    end
  end
end

defmodule Day2b.Score do
  @shape_points %{
    rock: 1,
    paper: 2,
    scissors: 3
  }

  @outcome_points %{
    win: 6,
    loose: 0,
    tie: 3
  }

  def points(shape, result) do
    Map.get(@outcome_points, result) + Map.get(@shape_points, shape)
  end
end
