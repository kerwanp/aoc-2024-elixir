defmodule Puzzle do
  def run(input, "1") do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      String.split(x, "   ")
      |> Enum.map(&String.to_integer/1)
    end)
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.sort/1)
    |> List.zip()
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def run(input, "2") do
    [list1, list2] =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn x ->
        String.split(x, "   ")
        |> Enum.map(&String.to_integer/1)
      end)
      |> List.zip()
      |> Enum.map(&Tuple.to_list/1)

    list1
    |> Enum.map(fn v -> v * Enum.count(list2, fn x -> x == v end) end)
    |> Enum.sum()
  end
end

[puzzle, path] = System.argv()
{_, input} = File.read(path)

input |> Puzzle.run(puzzle) |> IO.puts()
