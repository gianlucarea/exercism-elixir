defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(value) do
    expected_minutes_in_oven() - value
  end

  def preparation_time_in_minutes(number_layers), do: number_layers * 2

  def total_time_in_minutes(number_layers, minutes_in_oven) do
    minutes_in_oven + preparation_time_in_minutes(number_layers)
  end

  def alarm(), do: "Ding!"
end
