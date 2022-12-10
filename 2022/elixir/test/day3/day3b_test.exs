defmodule Day3b.TestCommoner do
    use ExUnit.Case, async: true

    @group1 [
        "vJrwpWtwJgWrhcsFMMfFFhFp",
        "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
        "PmmdzqPrVvPwwTWBwg"]

    @group2 [
        "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
        "ttgJtRGJQctTZtZT",
        "CrZsJsPPZsGzwwsLwLmpwMDw"]

    test "test the commoners" do
        assert Day3b.commoner(@group1) == 'r'
        assert Day3b.commoner(@group2) == 'Z'
    end
end
