defmodule Day2 do
  def calculate_score() do
    {:ok, input} = File.read("./lib/day2.input")

    input
    |> String.split("\n", trim: true)
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  def score(match) do
    case match do
      "A X" -> 4
      "A Y" -> 8
      "A Z" -> 3
      "B X" -> 1
      "B Y" -> 5
      "B Z" -> 9
      "C X" -> 7
      "C Y" -> 2
      "C Z" -> 6
    end
  end
end
