defmodule Day4a.Test do
  use ExUnit.Case, async: true

  test "proper pairs" do
    assert Day4a.parse("2-4,6-8") == {2..4, 6..8}
    assert Day4a.parse("2-3,4-5") == {2..3, 4..5}
    assert Day4a.parse("5-7,7-9") == {5..7, 7..9}
    assert Day4a.parse("2-8,3-7") == {2..8, 3..7}
    assert Day4a.parse("6-6,4-6") == {6..6, 4..6}
    assert Day4a.parse("2-6,4-8") == {2..6, 4..8}
  end

  test "test fully contained" do
    assert Day4a.fully_contained?(2..4, 6..8) == false
    assert Day4a.fully_contained?(2..3, 4..5) == false
    assert Day4a.fully_contained?(5..7, 7..9) == false
    assert Day4a.fully_contained?(2..8, 3..7) == true
    assert Day4a.fully_contained?(6..6, 4..6) == true
    assert Day4a.fully_contained?(2..6, 4..8) == false
  end

  @reject_a [true, true, false, false, false]
  @reject_b [true, true, true, false]
  test "reject works like I expect" do
    count_a = length(Enum.to_list(@reject_a |> Stream.reject(&(not &1))))
    count_b = length(Enum.to_list(@reject_a |> Stream.reject(&(not &1))))
    assert count_a == 2
    assert count_b == 3
  end
end
