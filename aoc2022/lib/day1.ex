defmodule Day1 do
  def sort_calories() do
    {:ok, input} = File.read("./lib/day1.input")

    input
    |> String.split("\n\n")
    |> Enum.map(
      &(String.split(&1)
        |> Enum.reduce(0, fn calories, acc -> acc + String.to_integer(calories) end))
    )
    |> Enum.sort(:desc)
  end

  def part_one() do
    sort_calories()
    |> hd()
  end

  def part_two() do
    sort_calories()
    |> Enum.take(3)
    |> Enum.sum()
  end
end
