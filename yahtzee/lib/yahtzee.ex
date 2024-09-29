defmodule Yahtzee do

  def score_lower(dice) do
    if check_three(dice) do
       %{:"Three of a kind" => Enum.sum(dice)}
    else
       %{:"Three of a kind" => 0}
    end
  end

  defp check_three(dice) do
     Enum.any?(dice, fn x -> Enum.count(dice, fn y -> y == x end) >= 3 end)
  end

end
