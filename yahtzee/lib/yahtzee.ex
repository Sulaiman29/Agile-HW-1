defmodule Yahtzee do

  def score_lower(dice) do
    cond do
      check_four(dice) ->
        %{:"Four of a kind" => Enum.sum(dice)}

      check_three(dice) ->
        %{:"Three of a kind" => Enum.sum(dice)}

      check_full_house(dice) ->
        %{:"Full house" => 25}

      true ->
        %{:"Three of a kind" => 0, :"Four of a kind" => 0, :"Full house" => 0}
    end
  end

  defp check_three(dice) do
    Enum.any?(dice, fn x -> Enum.count(dice, fn y -> y == x end) >= 3 end)
  end

  defp check_four(dice) do
    frequencies = Enum.frequencies(dice)
    Enum.any?(frequencies, fn {_key, count} -> count >= 4 end)
  end

  defp check_full_house(dice) do
    frequencies = Enum.frequencies(dice)
    values = Map.values(frequencies)
    Enum.sort(values) == [2, 3]
  end

end
