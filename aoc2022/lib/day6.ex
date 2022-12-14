defmodule Day6 do
  def part_one() do
    {:ok, input} = File.read("./lib/day6.input")

    find_marker(4, input, 0)
  end

  def part_two() do
    {:ok, input} = File.read("./lib/day6.input")

    find_marker(14, input, 0)
  end

  def find_marker(marker_length, str, i) do
    {marker, tail} = String.split_at(str, marker_length)
    tail = String.slice(marker, 1..-1) <> tail

    size =
      marker
      |> String.split("", trim: true)
      |> MapSet.new()
      |> MapSet.size()

    cond do
      size == marker_length -> i + marker_length
      true -> find_marker(marker_length, tail, i + 1)
    end
  end
end
