defmodule Day3 do
  def part_one() do
    {:ok, input} = File.read("./lib/day3.input")

    String.split(input)
    |> Enum.map(&(&1 |> split() |> find_common |> priority()))
    |> Enum.sum()
  end

  def part_two() do
    {:ok, input} = File.read("./lib/day3.input")

    chunks =
      String.split(input, "\n", trim: true)
      |> Enum.map(&String.split(&1, "", trim: true))
      |> Enum.chunk_every(3)

    Enum.map(chunks, &find_badge/1)
    |> Enum.map(&priority/1)
    |> Enum.sum()
  end

  def split(input) do
    String.split(input, "", trim: true)
    |> Enum.split(div(byte_size(input), 2))
  end

  def priority(<<cp::utf8>>) when cp in ?A..?Z, do: cp - ?A + 27

  def priority(<<cp::utf8>>) when cp in ?a..?z, do: cp - ?a + 1

  def find_badge([a, b, c]), do: hd((a -- a -- b) -- (a -- a -- b) -- c)

  def find_common({a, b}), do: hd(a -- a -- b)
end
