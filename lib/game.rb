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
check = false
checkmate = false

until game_finished == true
  player == "b" ? player = "w" : player = "b"
  board.display_board
  check = board.check(player, chessboard)

  if check
    board.players_move_in_check(player)
  elsif check == false && checkmate == false
      board.players_move(player)
  end
  
end


