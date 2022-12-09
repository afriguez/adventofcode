defmodule Day4 do
  def input() do
    {:ok, input} = File.read("./lib/day4.input")

    String.split(input, "\n", trim: true)
    |> Enum.map(&split_and_convert/1)
  end

  def part_one() do
    input()
    |> Enum.count(fn [l1, l2, r1, r2] ->
      (l2 <= r2 and l1 >= r1) or (l1 <= r1 and l2 >= r2)
    end)
  end

  def part_two() do
    input()
    |> Enum.count(fn [l1, l2, r1, r2] ->
      !Range.disjoint?(l1..l2, r1..r2)
    end)
  end

  def split_and_convert(line) do
    String.split(line, [",", "-"])
    |> Enum.map(&String.to_integer/1)
  end
end
