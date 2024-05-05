defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.first()
  end

  def initial(name) do
    String.upcase(name) |> first_letter() |> Kernel.<>(".")
  end

  def initials(full_name) do
    [name, surname] = String.split(full_name, " ")
    "#{initial(name)} #{initial(surname)}"
  end

  def pair(full_name1, full_name2) do
    p1 = initials(full_name1)
    p2 = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{p1}  +  #{p2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
