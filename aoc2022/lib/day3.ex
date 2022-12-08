defmodule Day3 do
  def input() do
    {:ok, input} = File.read("./lib/day3.input")

    String.split(input)
    |> Enum.map(&(&1 |> split() |> find_common |> priority()))
    |> Enum.sum()
  end

  def split(input) do
    String.split(input, "", trim: true)
    |> Enum.split(div(byte_size(input), 2))
  end

  def priority(<<cp::utf8>>) when cp in ?A..?Z, do: cp - ?A + 27

  def priority(<<cp::utf8>>) when cp in ?a..?z, do: cp - ?a + 1

  def find_common({a, b}), do: hd(a -- a -- b)
end
