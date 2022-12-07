defmodule Day3a.TestSplit do
  use ExUnit.Case, async: true

  test "test spitting various lengths" do
    assert Day3a.split("vJrwpWtwJgWrhcsFMMfFFhFp") == {"vJrwpWtwJgWr", "hcsFMMfFFhFp"}

    assert Day3a.split("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL") ==
             {"jqHRNqRjqzjGDLGL", "rsFMfFZSrLrFZsSL"}

    assert Day3a.split("PmmdzqPrVvPwwTWBwg") == {"PmmdzqPrV", "vPwwTWBwg"}
    assert Day3a.split("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn") == {"wMqvLMZHhHMvwLH", "jbvcjnnSBnvTQFn"}
    assert Day3a.split("ttgJtRGJQctTZtZT") == {"ttgJtRGJ", "QctTZtZT"}
    assert Day3a.split("CrZsJsPPZsGzwwsLwLmpwMDw") == {"CrZsJsPPZsGz", "wwsLwLmpwMDw"}
  end

  test "ensure priorities are correct" do
    assert Day3a.priority("a") == 1
    assert Day3a.priority("z") == 26
    assert Day3a.priority("A") == 27
    assert Day3a.priority("Z") == 52
  end
end
