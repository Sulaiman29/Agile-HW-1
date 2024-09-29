defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "Identify 'Three of a kind' with ones" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end


end
