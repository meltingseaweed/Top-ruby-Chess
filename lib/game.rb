require 'pry-byebug'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/white_pawn'
require_relative 'pieces/black_pawn'  
require_relative 'board'

binding.pry
board = Board.new
chessboard = board.chessboard
player = board.player
board.set_up_chessboard
board.display_board

players_piece = false

until players_piece == true do
  puts "Select one of your pieces to move"
  puts "for example: b2, g8"
  chosen_piece_position = next_move
  chosen_piece = chessboard[chosen_piece_position[0]][chosen_piece_position[1]]
  if chosen_piece != nil && chosen_piece.team == player
    players_piece = true
  end
end

type_of_piece = chosen_piece.class
case type_of_piece
when Rook
  moves = chosen_piece.movement_rook(chessboard)
  capture = chosen_piece.capturable(chessboard)
when Knight
  moves = chosen_piece.movement_knight(chessboard)
  capture = chosen_piece.capturable(chessboard)
when Bishop
  moves = chosen_piece.movement_bishop(chessboard)
  capture = chosen_piece.capturable(chessboard)
when Queen
  moves = chosen_piece.movement_queen(chessboard)
  capture = chosen_piece.capturable(chessboard)
when King
  moves = chosen_piece.movement_king(chessboard)
  capture = chosen_piece.capturable(chessboard)
when BlackPawn
  moves = chosen_piece.movement_pawn(chessboard)
  capture = chosen_piece.capturable(chessboard)
when WhitePawn
  moves = chosen_piece.movement_pawn(chessboard)
  capture = chosen_piece.capturable(chessboard)
else
  puts "Class not recognised"
end

puts
puts "moves are: #{moves}"
puts "captures are: #{capture}"


puts "Choose your next move"
player_next = next_move

until moves.include?(player_next) || capture.include?(player_next) do
  puts "Sorry, this move cannot be made"
  player_next = next_move
end

if moves.include?(player_next)
  chessboard[player_next[0]][player_next[1]] = chosen_piece
  chessboard[chosen_piece_position[0]][chosen_piece_position[1]]
elsif capture.include?(player_next)
  if chessboard[player_next[0]][player_next[1]].team == "w"
    board.captured_white << chessboard[player_next[0]][player_next[1]]
    chessboard[player_next[0]][player_next[1]] = chosen_piece
    chessboard[chosen_piece_position[0]][chosen_piece_position[1]]
  elsif chessboard[player_next[0]][player_next[1]].team == "b"
    board.captured_black << chessboard[player_next[0]][player_next[1]]
    chessboard[player_next[0]][player_next[1]] = chosen_piece
    chessboard[chosen_piece_position[0]][chosen_piece_position[1]]
  end
end
# Can we add a function to go back and change pieces?



def players_turn(player)
  player == "b" ? player = "w" : player = "b"
end

def next_move
  piece = gets.chomp
  chosen_piece = piece.split("")
  chosen_piece = convert_to_positions(chosen_piece)
end

def convert_to_positions(string)
  letter_array = %w(a b c d e f g h)
  num_array = [7, 6, 5, 4, 3, 2, 1, 0]
  chosen_col = letter_array.index(chosen_piece[0])
  chosen_row = num_array[chosen_piece[1].to_i - 1]
  [chosen_row, chosen_col]
end

def convert_to_readable(array)
  letter_array = %w(a b c d e f g h)
  num_array = [7, 6, 5, 4, 3, 2, 1, 0]
  new = array.map do |x, y|
    x = num_array[x-1].to_s
    y = letter_array[y]
    [y,x]
  end
end