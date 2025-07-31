defmodule LibraryFees do

  @monday 1
  @noon ~T[12:00:00]

  def datetime_from_string(string), do: 
    NaiveDateTime.from_iso8601!(string)

  # datetime.hour < 12 also OK
  def before_noon?(datetime), do: 
    NaiveDateTime.to_time(datetime) 
      |> Time.compare(@noon) == :lt

  def return_date(checkout_datetime), do: 
    NaiveDateTime.to_date(checkout_datetime)
      |> Date.add(extra_days(checkout_datetime))

  def days_late(planned_return_date, actual_return_datetime), do:
    NaiveDateTime.to_date(actual_return_datetime)
      |> Date.diff(planned_return_date)
      |> Kernel.max(0)

  def monday?(datetime), do:
    NaiveDateTime.to_date(datetime)
      |> Date.day_of_week
      |> Kernel.==(@monday)

  def calculate_late_fee(checkout, return, rate) when is_bitstring(checkout) and is_bitstring(return) do
    calculate_late_fee(datetime_from_string(checkout), datetime_from_string(return), rate)
  end

  def calculate_late_fee(checkout, return, rate) do
    days_late(NaiveDateTime.to_date(checkout), return)
      |> days_overdue(extra_days(checkout))
      |> Kernel.*(rate) 
      |> discount(monday?(return))
  end

  defp extra_days(datetime), do: 
    before_noon?(datetime) 
      |> no_extra_day 
      |> Kernel.+(28)

  defp no_extra_day(true), do: 0
  defp no_extra_day(false), do: 1

  defp discount(fee, true), do: 
    (fee*0.5) |> Float.floor 
  defp discount(fee, false), do:
    fee

  defp days_overdue(actual_days, allowed_days), do: 
    max(0, (actual_days-allowed_days))

end
