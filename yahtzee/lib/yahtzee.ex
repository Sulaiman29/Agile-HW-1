defmodule Yahtzee do
  def hello do
    :world
  end

  def score_lower([]), do: %{:"Three of a kind" => 0}
  def score_lower([head | tail]) do
    %{:"Three of a kind" => head + (score_lower(tail)[:"Three of a kind"])}
  end


end
