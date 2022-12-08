defmodule Day3a.TestSplit do
  use ExUnit.Case, async: true

  test "test spitting various lengths" do
    assert Day3a.split("vJrwpWtwJgWrhcsFMMfFFhFp") == {'vJrwpWtwJgWr', 'hcsFMMfFFhFp'}

    assert Day3a.split("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL") ==
             {'jqHRNqRjqzjGDLGL', 'rsFMfFZSrLrFZsSL'}

    assert Day3a.split("PmmdzqPrVvPwwTWBwg") == {'PmmdzqPrV', 'vPwwTWBwg'}
    assert Day3a.split("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn") == {'wMqvLMZHhHMvwLH', 'jbvcjnnSBnvTQFn'}
    assert Day3a.split("ttgJtRGJQctTZtZT") == {'ttgJtRGJ', 'QctTZtZT'}
    assert Day3a.split("CrZsJsPPZsGzwwsLwLmpwMDw") == {'CrZsJsPPZsGz', 'wwsLwLmpwMDw'}
  end

  test "ensure priorities are correct" do
    assert Day3a.item_priority('a') == 1
    assert Day3a.item_priority('z') == 26
    assert Day3a.item_priority('A') == 27
    assert Day3a.item_priority('Z') == 52

    # Priorities from the explanation
    assert Day3a.item_priority('p') == 16
    assert Day3a.item_priority('L') == 38
    assert Day3a.item_priority('P') == 42
    assert Day3a.item_priority('v') == 22
    assert Day3a.item_priority('t') == 20
    assert Day3a.item_priority('s') == 19
  end

  test "commonality works" do
    assert Day3a.common('vJrwpWtwJgWr', 'hcsFMMfFFhFp') == 'p'
    assert Day3a.common('jqHRNqRjqzjGDLGL', 'rsFMfFZSrLrFZsSL') == 'L'

    assert Day3a.common('PmmdzqPrV', 'vPwwTWBwg') == 'P'
    assert Day3a.common('wMqvLMZHhHMvwLH', 'jbvcjnnSBnvTQFn') == 'v'
    assert Day3a.common('ttgJtRGJ', 'QctTZtZT') == 't'
    assert Day3a.common('CrZsJsPPZsGz', 'wwsLwLmpwMDw') == 's'
  end

  test "right priorities" do
    assert Day3a.prioritize("vJrwpWtwJgWrhcsFMMfFFhFp") == 16
    assert Day3a.prioritize("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL") == 38
    assert Day3a.prioritize("PmmdzqPrVvPwwTWBwg") == 42
    assert Day3a.prioritize("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn") == 22
    assert Day3a.prioritize("ttgJtRGJQctTZtZT") == 20
    assert Day3a.prioritize("CrZsJsPPZsGzwwsLwLmpwMDw") == 19
  end
end
