defmodule Day2a do
  def outcome(oponent, player) when oponent == player do
    :tie
  end

  def outcome(:rock, player) do
    case player do
      :paper -> :win
      :scissors -> :loose
    end
  end

  def outcome(:paper, player) do
    case player do
      :scissors -> :win
      :rock -> :loose
    end
  end

  def outcome(:scissors, player) do
    case player do
      :rock -> :win
      :paper -> :loose
    end
  end

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

  def calculate(oponent, player) do
    points(player, outcome(oponent, player))
  end

  def points(shape, result) do
    Map.get(@outcome_points, result) + Map.get(@shape_points, shape)
  end

  def parse(code) do
    case code do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors

      "X" -> :rock
      "Y" -> :paper
      "Z" -> :scissors
    end
  end

  def parse_line("") do
  end

  def parse_line(line) do
    [opponent, player] = String.split(line)
    {parse(opponent), parse(player)}
  end
end
