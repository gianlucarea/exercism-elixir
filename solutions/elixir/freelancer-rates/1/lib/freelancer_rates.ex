defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
     hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    sum_of_discount = (before_discount/ 100) * discount
    before_discount - sum_of_discount
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount((daily_rate(hourly_rate) * 22), discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
     Float.floor(budget / apply_discount(daily_rate(hourly_rate),discount), 1)
  end
end
