defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "Identify 'Three of a kind' with ones" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end

  test "Identify 'Three of a kind' with exact threes" do
    assert %{"Three of a kind": 9} = Yahtzee.score_lower([3, 3, 3])
  end

  test "Identify 'Three of a kind' with exact fours" do
    assert %{"Three of a kind": 16} = Yahtzee.score_lower([4, 4, 4, 4])
  end

  test "Identify 'Three of a kind' with exact fives" do
    assert %{"Three of a kind": 25} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  end

  test "Identify 'Three of a kind' with empty list" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([])
  end

  test "Identify 'Three of a kind' with non-consecutive numbers" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([4, 2, 4, 3, 4])
  end

  test "Identify 'Three of a kind' with fail case" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 4, 3, 4])
  end

  # Four of a kind

  test "Identify 'Four of a kind' with face 5 and different first die" do
    assert %{"Four of a kind": 24} = Yahtzee.score_lower([4, 5, 5, 5, 5])
  end

  test "Identify 'Four of a kind' with face 1" do
    assert %{"Four of a kind": 5} = Yahtzee.score_lower([1, 1, 1, 1, 1])
  end

  test "Identify 'Four of a kind' with three 6 of a kind" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([6, 6, 6, 2, 1])
  end

  test "Identify 'Four of a kind' with empty list" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([])
  end

  test "Identify 'Four of a kind' with no matching four" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end

  # Full House Test Cases

  test "Identify 'Full house' with every face" do
    assert %{"Full house": 25} = Yahtzee.score_lower([7, 7, 6, 6, 6])
  end

  test "Identify 'Full house' with every face" do
    assert %{"Full house": 0} = Yahtzee.score_lower([6, 1, 3, 3, 3])
  end

  test "Identify 'Full house' with every face" do
    assert %{"Full house": 0} = Yahtzee.score_lower([7, 7, 1, 6, 6])
  end

  test "Identify 'Full house' with every face" do
    assert %{"Full house": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end

end
