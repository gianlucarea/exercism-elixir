defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_head | tail]) do
    tail
  end

  def first([head | _tail]) do
    head
  end

  def count(list), do: count(list, 0)
  defp count([],acc), do: acc
  defp count([_ | tail],acc), do: count(tail, acc + 1)

  def functional_list?(list) do
    "Elixir" in list
  end
end
