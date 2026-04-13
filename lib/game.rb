require 'pry-byebug'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/white_pawn'
require_relative 'pieces/black_pawn'  
require_relative 'board'
require_relative 'chess_methods'

board = Board.new
chessboard = board.chessboard
player = "w"
board.set_up_chessboard
board.display_board

players_piece = false

until players_piece == true do
  puts "Select one of your pieces to move"
  puts "for example: b2, g8"
  chosen_piece_position = board.next_move
  chosen_piece = chessboard[chosen_piece_position[0]][chosen_piece_position[1]]
  if chosen_piece != nil && chosen_piece.team == player
    players_piece = true
  end
end
binding.pry
moves = chosen_piece.movement(chessboard)
capture = chosen_piece.capturable(chessboard)

puts
puts "moves are: #{moves}"
puts "captures are: #{capture}"


puts "Choose your next move"
player_next = board.next_move

until moves.include?(player_next) || capture.include?(player_next) do
  puts "Sorry, this move cannot be made"
  player_next = board.next_move
end
# Can we add a function to go back and change pieces?

if moves.include?(player_next)
  chessboard[player_next[0]][player_next[1]] = chosen_piece
  chessboard[chosen_piece_position[0]][chosen_piece_position[1]] = nil
elsif capture.include?(player_next)
  if chessboard[player_next[0]][player_next[1]].team == "w"
    board.captured_white << chessboard[player_next[0]][player_next[1]]
    chessboard[player_next[0]][player_next[1]] = chosen_piece
    chessboard[chosen_piece_position[0]][chosen_piece_position[1]] = nil
  elsif chessboard[player_next[0]][player_next[1]].team == "b"
    board.captured_black << chessboard[player_next[0]][player_next[1]]
    chessboard[player_next[0]][player_next[1]] = chosen_piece
    chessboard[chosen_piece_position[0]][chosen_piece_position[1]] = nil
  end
end

board.display_board




