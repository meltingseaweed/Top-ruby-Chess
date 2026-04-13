require 'pry-byebug'
require 'colorize'
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
player = "b"
board.set_up_chessboard
game_finished = false

until game_finished == true
  players_piece = false
  player == "b" ? player = "w" : player = "b"
  board.display_board
  if player == "w"
    puts "It is now white's turn to move"
  else
    puts "It is now black's turn to move"
  end
  until players_piece == true
    puts "Select one of your pieces to move"
    chosen_piece_position = board.next_move
    chosen_piece = chessboard[chosen_piece_position[0]][chosen_piece_position[1]]
    if chosen_piece != nil && chosen_piece.team == player
      players_piece = true
    end
  end
  moves = chosen_piece.movement(chessboard)
  capture = chosen_piece.capturable(chessboard)

  readable_moves = board.convert_to_readable(moves)
  readable_capture = board.convert_to_readable(capture)
  puts "Possible moves are: #{readable_moves}".colorize(:green)
  puts "Pieces you can capture : #{readable_capture}".colorize(:yellow)
  puts "Choose your next move"
  player_next = board.next_move

  until moves.include?(player_next) || capture.include?(player_next)
    puts "Sorry, this move cannot be made"
    player_next = board.next_move
  end
# Can we add a function to go back and change pieces?

  if moves.include?(player_next)
    chessboard[player_next[0]][player_next[1]] = chosen_piece
   # Need to update the piece's position
    chosen_piece.position = player_next
    chessboard[chosen_piece_position[0]][chosen_piece_position[1]] = nil
  elsif capture.include?(player_next)
    if chessboard[player_next[0]][player_next[1]].team == "w"
      board.remaining_white.delete(chessboard[player_next[0]][player_next[1]])
      chessboard[player_next[0]][player_next[1]] = chosen_piece
      chosen_piece.position = player_next
      chessboard[chosen_piece_position[0]][chosen_piece_position[1]] = nil
    elsif chessboard[player_next[0]][player_next[1]].team == "b"
      board.remaining_black.delete(chessboard[player_next[0]][player_next[1]])
      chessboard[player_next[0]][player_next[1]] = chosen_piece
      chosen_piece.position = player_next
      chessboard[chosen_piece_position[0]][chosen_piece_position[1]] = nil
    end
  end

end


