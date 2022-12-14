defmodule Day5 do
  def part_one() do
    {:ok, input} = File.read("./lib/day5.input")

    [first_half, second_half] = String.split(input, "\n\n", trim: true)

    crates = parse_crates(first_half)
    commands = parse_commands(second_half)

    Enum.reduce(commands, crates, fn cmd, crates ->
      if is_list(cmd) do
        [amount, from, to] = cmd

        {to_move, to_conserve} = Enum.split(crates[from], amount)

        crates
        |> Map.put(from, to_conserve)
        |> Map.put(to, Enum.reverse(to_move) ++ crates[to])
      end
    end)
  end

  def parse_crates(crates) do
    String.split(crates, "\n")
    |> Enum.drop(-1)
    |> Enum.reverse()
    |> Enum.flat_map(fn row ->
      String.graphemes(row)
      |> Enum.drop_every(2)
      |> Enum.with_index()
      |> Enum.filter(fn {crate, _column} -> crate != " " end)
    end)
    |> Enum.reduce(%{}, fn {crate, column}, map ->
      Map.update(map, div(column, 2) + 1, [crate], fn current -> [crate | current] end)
    end)
  end

  def parse_commands(commands) do
    String.split(commands, "\n", trim: true)
    |> Enum.map(fn cmd ->
      [_, amount, _, from, _, to] = String.split(cmd, " ")

      [amount, from, to]
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
