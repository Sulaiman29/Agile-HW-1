defmodule Yahtzee do

  def score_lower(dice) do
    cond do
      # has_small_straight?(dice) -> %{"Small Straight": 30}
      # yahtzee?(dice) -> %{"Yahtzee": 50}
      # has_large_straight?(dice) -> %{"Large Straight": 40}
      # has_full_house?(dice) -> %{"Full house": 25}
      # has_four_of_a_kind?(dice) -> %{"Four of a kind": Enum.sum(dice)}
      # has_three_of_a_kind?(dice) -> %{"Three of a kind": Enum.sum(dice)}
      true -> %{"Small Straight": 0, "Yahtzee": 0, "Large Straight": 0, "Full house": 0, "Four of a kind": 0, "Three of a kind": 0}
    end
  end

  defp has_small_straight?(dice) do
    unique_dice = dice |> Enum.uniq() |> Enum.sort()

    # Check if a large straight exists first
    if unique_dice == [1, 2, 3, 4, 5] or unique_dice == [2, 3, 4, 5, 6] do
      false  # Large straight exists, so no small straight is counted
    else
      # Check for small straights
      Enum.chunk_every(unique_dice, 4, 1, :discard)
      |> Enum.any?(fn chunk -> chunk == [1, 2, 3, 4] or chunk == [2, 3, 4, 5] or chunk == [3, 4, 5, 6] end)
    end
  end

  defp yahtzee?(dice) do
    Enum.uniq(dice) |> length == 1
  end

  defp has_large_straight?(dice) do
    sorted_dice = Enum.sort(dice)

    # Check if sorted dice is [1, 2, 3, 4, 5] or [2, 3, 4, 5, 6]
    sorted_dice == [1, 2, 3, 4, 5] or sorted_dice == [2, 3, 4, 5, 6]
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
