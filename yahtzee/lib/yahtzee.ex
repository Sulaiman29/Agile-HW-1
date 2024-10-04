defmodule Yahtzee do

  def score_lower(dice) do
    scores = %{
      "Small Straight": has_small_straight?(dice),
      "Yahtzee": yahtzee?(dice),
      "Large Straight": has_large_straight?(dice),
      "Full house": has_full_house?(dice),
      "Four of a kind": has_four_of_a_kind?(dice),
      "Three of a kind": has_three_of_a_kind?(dice),
    }
    # Check if all scores are zero
    all_zero = Enum.all?(scores, fn {_key, score} -> score == 0 end)

    # Add "Chance" only if all other scores are zero
    if all_zero do
      Map.put(scores, :"Chance", Enum.sum(dice))
    else
      Map.put(scores, :"Chance", 0)  # Ensure Chance is zero when other scores exist
    end
  end

  defp has_small_straight?(dice) do
    unique_dice = dice |> Enum.uniq() |> Enum.sort()

    # Check if a large straight exists first
    if unique_dice == [1, 2, 3, 4, 5] or unique_dice == [2, 3, 4, 5, 6] do
      0  # Large straight exists, so no small straight is counted
    else
      # Check for small straights
      if Enum.chunk_every(unique_dice, 4, 1, :discard)
         |> Enum.any?(fn chunk -> chunk == [1, 2, 3, 4] or chunk == [2, 3, 4, 5] or chunk == [3, 4, 5, 6] end) do
        30  # Small straight score
      else
        0  # No small straight
      end
    end
  end

  defp yahtzee?(dice) do
    if Enum.uniq(dice) |> length == 1, do: 50, else: 0
  end


  defp has_large_straight?(dice) do
    sorted_dice = Enum.sort(dice)

    if sorted_dice == [1, 2, 3, 4, 5] or sorted_dice == [2, 3, 4, 5, 6] do
      40
    else
      0
    end
  end

  defp has_full_house?(dice) do
    frequencies = Enum.frequencies(dice)

    case Enum.sort_by(frequencies, fn {_number, count} -> -count end) do
      [{_, 3}, {_, 2}] -> 25  # Full house score
      _ -> 0  # Not a full house
    end
  end

  defp has_four_of_a_kind?(dice) do
    frequencies = Enum.frequencies(dice)

    if Enum.any?(frequencies, fn {_number, count} -> count >= 4 end) do
      Enum.sum(dice)  # Sum of dice for four of a kind
    else
      0  # Not four of a kind
    end
  end

  defp has_three_of_a_kind?(dice) do
    frequencies = Enum.frequencies(dice)

    if Enum.any?(frequencies, fn {_number, count} -> count >= 3 end) do
      Enum.sum(dice)  # Sum of dice for three of a kind
    else
      0  # Not three of a kind
    end
  end
end
