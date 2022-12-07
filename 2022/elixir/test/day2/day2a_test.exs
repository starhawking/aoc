defmodule Day2a.CalculateTest do
  use ExUnit.Case, async: true

  test "Calculates Correctly" do
    assert Day2a.calculate(:rock, :paper) == 8
    assert Day2a.calculate(:paper, :rock) == 1
    assert Day2a.calculate(:scissors, :scissors) == 6
  end
end

defmodule Day2a.GameLogicTest do
  use ExUnit.Case, async: true

  test "Gets the right winner" do
    assert Day2a.outcome(:rock, :rock) == :tie
    assert Day2a.outcome(:paper, :paper) == :tie
    assert Day2a.outcome(:scissors, :scissors) == :tie

    assert Day2a.outcome(:rock, :paper) == :win
    assert Day2a.outcome(:paper, :rock) == :loose

    assert Day2a.outcome(:paper, :scissors) == :win
    assert Day2a.outcome(:scissors, :paper) == :loose

    assert Day2a.outcome(:rock, :scissors) == :loose
    assert Day2a.outcome(:scissors, :rock) == :win
  end
end

defmodule Day2a.ParseTest do
  use ExUnit.Case, async: true

  test "parses correctly" do
    assert Day2a.parse_line("A X") == {:rock, :rock}
    assert Day2a.parse_line("A Y") == {:rock, :paper}
  end
end
