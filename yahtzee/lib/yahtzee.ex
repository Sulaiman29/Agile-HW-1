defmodule Yahtzee do
  def hello do
    :world
  end

  def score_lower([]), do: 0
  def score_lower([head | tail]), do: head + score_lower(tail)


end
