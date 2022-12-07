defmodule Day2 do
  def input() do
    {:ok, input} = File.read("./lib/day2.input")

    input
    |> String.split("\n", trim: true)
  end

  def score(round) do
    case round do
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

  def part_one() do
    input()
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  def part_two() do
    input()
    |> Enum.map(
      &case &1 do
        "A X" -> "A Z"
        "A Y" -> "A X"
        "A Z" -> "A Y"
        "B X" -> "B X"
        "B Y" -> "B Y"
        "B Z" -> "B Z"
        "C X" -> "C Y"
        "C Y" -> "C Z"
        "C Z" -> "C X"
      end
    )
    |> Enum.map(&score/1)
    |> Enum.sum()
  end
end
