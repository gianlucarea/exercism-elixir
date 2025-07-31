defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    get_bite_size_color(color_count,1)
  end

  defp get_bite_size_color(color_count,number) do
    if Integer.pow(2, number) >= color_count do
      number
    else
      get_bite_size_color(color_count,number+1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
        <<0::2,1::2,2::2,3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size) , picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<pixel::size(bit_size), _rest::bitstring>> = picture
    pixel
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
      bit_size = palette_bit_size(color_count)
    <<_pixel::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
