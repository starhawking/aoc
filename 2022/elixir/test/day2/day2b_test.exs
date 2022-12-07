defmodule Day2b.ParseTest do
  use ExUnit.Case, async: true

  test "parses correctly" do
    assert Day2b.parse_line("A X") == {:rock, :loose}
    assert Day2b.parse_line("A Y") == {:rock, :tie}
    assert Day2b.parse_line("A Z") == {:rock, :win}

    assert Day2b.parse_line("B X") == {:paper, :loose}
    assert Day2b.parse_line("B Y") == {:paper, :tie}
    assert Day2b.parse_line("B Z") == {:paper, :win}
  end
end

defmodule Day2b.GameTest do
  use ExUnit.Case, async: true

  test "handles game logic correctly" do
    assert Day2b.Game.desired(:rock, :tie) == :rock
    assert Day2b.Game.desired(:paper, :loose) == :rock
    assert Day2b.Game.desired(:scissors, :win) == :rock
  end
end
