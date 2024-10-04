defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  # # Three of a kind tests
  # test "Identify 'Three of a kind' with ones" do
  #   assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  # end

  # test "Identify 'Three of a kind' with exact threes" do
  #   assert %{"Three of a kind": 9} = Yahtzee.score_lower([3, 3, 3])
  # end

  # test "Identify 'Three of a kind' with exact fours" do
  #   assert %{"Three of a kind": 16} = Yahtzee.score_lower([4, 4, 4, 4])
  # end

  # test "Identify 'Three of a kind' with exact fives" do
  #   assert %{"Three of a kind": 25} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  # end

  # test "Identify 'Three of a kind' with empty list" do
  #   assert %{"Three of a kind": 0} = Yahtzee.score_lower([])
  # end

  # test "Identify 'Three of a kind' with non-consecutive numbers" do
  #   assert %{"Three of a kind": 17} = Yahtzee.score_lower([4, 2, 4, 3, 4])
  # end

  # test "Identify 'Three of a kind' with fail case" do
  #   assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 4, 3, 4])
  # end

  # # Four of a kind

  # test "Identify 'Four of a kind' with face 5 and different first die" do
  #   assert %{"Four of a kind": 24} = Yahtzee.score_lower([4, 5, 5, 5, 5])
  # end

  # test "Identify 'Four of a kind' with face 1" do
  #   assert %{"Four of a kind": 5} = Yahtzee.score_lower([1, 1, 1, 1, 1])
  # end

  # test "Identify 'Four of a kind' with three 6 of a kind" do
  #   assert %{"Four of a kind": 0} = Yahtzee.score_lower([6, 6, 6, 2, 1])
  # end

  # test "Identify 'Four of a kind' with empty list" do
  #   assert %{"Four of a kind": 0} = Yahtzee.score_lower([])
  # end

  # test "Identify 'Four of a kind' with no matching four" do
  #   assert %{"Four of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  # end

  # # Full house tests
  # test "Identify 'Full house' with every face" do
  #   assert %{"Full house": 25} = Yahtzee.score_lower([7, 7, 6, 6, 6])
  # end

  # test "Identify 'Full house' with 3 same face" do
  #   assert %{"Full house": 0} = Yahtzee.score_lower([6, 1, 3, 3, 3])
  # end

  # test "Identify 'Full house' with 2 same face" do
  #   assert %{"Full house": 0} = Yahtzee.score_lower([7, 7, 1, 6, 6])
  # end

  # test "Identify 'Full house' with no same face" do
  #   assert %{"Full house": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  # end

  # test "Identify 'Full house' with no face" do
  #   assert %{"Full house": 25} = Yahtzee.score_lower([2, 2, 2, 3, 3])
  # end

  # # large straight tests
  # test "Identify 'Large Straight' with correct 2 to 6" do
  #   assert %{"Large Straight": 40} = Yahtzee.score_lower([2, 3, 4, 5, 6])
  # end

  # test "Identify 'Large Straight' with correct 1 to 5" do
  #   assert %{"Large Straight": 40} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  # end

  # test "Identify 'Large Straight' with failing case" do
  #   assert %{"Large Straight": 0} = Yahtzee.score_lower([1, 5, 4, 5, 6])
  # end

  # test "Identify 'Large Straight' with different order" do
  #   assert %{"Large Straight": 40} = Yahtzee.score_lower([3, 1, 5, 2, 4])
  # end

  # Small straight tests
  test "Identify 'Small Straight'" do
    assert %{"Small Straight": 30} = Yahtzee.score_lower([2, 3, 2, 5, 4])
  end

  test "Identify 'Small Straight' with passing case" do
    assert %{"Small Straight": 30} = Yahtzee.score_lower([2, 3, 3, 4, 5])
  end

  test "Identify 'Small Straight' with failing case" do
    assert %{"Small Straight": 0} = Yahtzee.score_lower([2, 1, 2, 5, 4])
  end


  # # Yahtzee
  # test "Identify 'Yahtzee' with fives" do
  #   assert %{"Yahtzee": 50} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  # end

  # test "Identify 'Yahtzee' with different numbers" do
  #   assert %{"Yahtzee": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  # end


end
