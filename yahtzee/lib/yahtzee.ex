defmodule Yahtzee do

  def score_lower(dice) do
    cond do
      check_four(dice) ->
        %{:"Four of a kind" => Enum.sum(dice)}

      check_three(dice) ->
        %{:"Three of a kind" => Enum.sum(dice)}

      true ->
        %{:"Three of a kind" => 0, :"Four of a kind" => 0}
    end
  end

  defp check_three(dice) do
     Enum.any?(dice, fn x -> Enum.count(dice, fn y -> y == x end) >= 3 end)
  end

  defp check_four(dice) do
    frequencies = Enum.frequencies(dice)
    Enum.any?(frequencies, fn {_key, count} -> count >= 4 end)
  end

end
