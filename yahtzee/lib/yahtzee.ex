defmodule Yahtzee do
  def score_lower(dice) do
    cond do

      has_full_house?(dice) -> %{"Full house": 25}
      has_four_of_a_kind?(dice) -> %{"Four of a kind": Enum.sum(dice)}
      has_three_of_a_kind?(dice) -> %{"Three of a kind": Enum.sum(dice)}
      true -> %{"Full house": 0, "Four of a kind": 0, "Three of a kind": 0}
    end
  end


  defp has_full_house?(dice) do
    dice
    |> Enum.frequencies()
    |> Enum.sort_by(fn {_number, count} -> -count end)
    |> case do
      [{_, 3}, {_, 2}] -> true
      _ -> false
    end
  end

  defp has_four_of_a_kind?(dice) do
    dice
    |> Enum.frequencies()
    |> Enum.any?(fn {_number, count} -> count >= 4 end)
  end

  defp has_three_of_a_kind?(dice) do
    dice
    |> Enum.frequencies()
    |> Enum.any?(fn {_number, count} -> count >= 3 end)
  end
end
