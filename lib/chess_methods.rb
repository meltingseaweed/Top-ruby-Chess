require 'pry-byebug'

module ChessMethods

def next_move
  piece = gets.chomp
  if piece == "save"
    return "save"
  end
  chosen_piece = piece.split("")
  chosen_piece = convert_to_positions(chosen_piece)
end

def convert_to_positions(array)
  letter_array = %w(a b c d e f g h)
  num_array = [7, 6, 5, 4, 3, 2, 1, 0]
  chosen_col = letter_array.index(array[0])
  chosen_row = num_array[array[1].to_i - 1]
  [chosen_row, chosen_col]
end

def convert_to_readable(array)
  letter_array = %w(a b c d e f g h)
  num_array = [8, 7, 6, 5, 4, 3, 2, 1]
  if array.include?("castleleft")
    array.delete("castleleft")
    new = array.map do |x, y|
    x = num_array[x].to_s
    y = letter_array[y]
    ["#{y}#{x}"]
  end
  array.push("castleleft")
  elsif array.include?("castleright")
    array.delete("castleright")
    new = array.map do |x, y|
    x = num_array[x].to_s
    y = letter_array[y]
    ["#{y}#{x}"]
  end
  array.push("castleright")
  else
  new = array.map do |x, y|
    x = num_array[x].to_s
    y = letter_array[y]
    ["#{y}#{x}"]
  end
  end

end
end