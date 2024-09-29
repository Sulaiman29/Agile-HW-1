defmodule Yahtzee do
  def hello do
    :world
  end

  def score_lower([]), do: %{:"Three of a kind" => 0}
  def score_lower([head | tail]) do
    %{:"Three of a kind" => head + (score_lower(tail)[:"Three of a kind"])}
  end

#   def score_lower(dice) do
#     if three_of_a_kind?(dice) do
#       %{"Three of a kind" => Enum.sum(dice)}
#     else
#       %{"Three of a kind" => 0}
#     end
#   end

#   defp three_of_a_kind?(dice) do
#     Enum.any?(dice, fn x -> Enum.count(dice, fn y -> y == x end) >= 3 end)
#   end

end
