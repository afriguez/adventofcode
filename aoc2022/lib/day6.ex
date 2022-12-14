defmodule Day6 do
  def part_one() do
    {:ok, input} = File.read("./lib/day6.input")

    find_four(input, 0)
  end

  def find_four(str, i) do
    {marker, tail} = String.split_at(str, 4)
    tail = String.slice(marker, 1..-1) <> tail

    size =
      marker
      |> String.split("", trim: true)
      |> MapSet.new()
      |> MapSet.size()

    cond do
      size == 4 -> i + 4
      true -> find_four(tail, i + 1)
    end
  end
end
