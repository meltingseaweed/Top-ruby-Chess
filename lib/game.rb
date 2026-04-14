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
player = "w"
board.set_up_chessboard
check = false
checkmate = false

until checkmate == true
  board.display_board
  check = board.check(player, chessboard)
  # If check, make a move that takes them out of check.
  # If false, then make a regular move.
  if check
    board.still_in_check?(player)
  elsif check == false && checkmate == false
      board.players_move(player)
  end

  player == "b" ? player = "w" : player = "b"
  if board.in_checkmate?(player)
    checkmate = true
  end
end
player == "b" ? player = "w" : player = "b"
puts "Congratulations, player #{player} is the winner!"
puts "The game is over, thank you for playing :)"


