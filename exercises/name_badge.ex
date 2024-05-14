defmodule NameBadge do
  def print(id, name, department) do
    department = if department, do: department, else: "owner"
    elif_id = if id, do: "[#{id}] - ", else: ""
    elif_id <> "#{name} - #{String.upcase(department)}"
  end
end
