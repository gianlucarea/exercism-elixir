defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.first() 
  end

  def initial(name) do
    first_letter(name) |> String.upcase() |> Kernel.<> "."
  end

  def initials(full_name) do
    [name, surname] = String.split(full_name)
    name_initial = initial(name)
    surname_initial = initial(surname)
    name_initial <> " " <> surname_initial
  end

  def pair(full_name1, full_name2) do
    n1 = initials(full_name1)
    n2 = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{n1}  +  #{n2}     **
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
