defmodule BirdCount do
  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | days]), do: [today + 1 | days]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _ ]), do: true
  def has_day_without_birds?([_ | days ]), do: has_day_without_birds?(days)

  def total([]), do: 0
  def total([today | days]), do: today + total(days)


  def busy_days(list), do: busy_days(list, 0)
  defp busy_days([],acc), do: acc
  defp busy_days([today | days], acc) when today >= 5 ,do: busy_days(days,acc + 1)
  defp busy_days([_ | days], acc), do: busy_days(days,acc)

end
