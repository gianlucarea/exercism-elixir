defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    value_of_discount = (before_discount / 100) * discount
    before_discount - value_of_discount
  end

  def monthly_rate(hourly_rate, discount) do
    montly_rate_before_discount = daily_rate(hourly_rate) * 22
    ceil(apply_discount(montly_rate_before_discount, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate_discounted = apply_discount(hourly_rate, discount)
    Float.floor((budget / 8) / hourly_rate_discounted, 1)
  end
end
