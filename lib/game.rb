require 'pry-byebug'
require 'colorize'
require 'yaml'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/white_pawn'
require_relative 'pieces/black_pawn'  
require_relative 'board'
require_relative 'chess_methods'

def load_game
  game = Psych.safe_load_file('game_one.yml', aliases: true, permitted_classes: [Board, Pieces, Rook, Knight, Bishop, Queen, King, WhitePawn, BlackPawn])
  game
end

puts "Would you like to load a previous game?"
puts "y/n"
load = gets.chomp
if load == "y"
  board = load_game
  board.display_board
  binding.pry
  puts "Did it load correctly?"
else
  board = Board.new
  chessboard = board.chessboard
  player = "w"
  board.set_up_chessboard
end
check = false
checkmate = false
puts "Note that you can save at anytime by inputting 'save' during your turn"
until checkmate == true
  board.display_board
  check = board.check(player, chessboard)
  # If check, make a move that takes them out of check.
  # If false, then make a regular move.
  if check
    board.still_in_check?(player)
  elsif check == false && checkmate == false
      turn = board.players_move(player)
      if turn == "save"
        board.save(board, "one")
        next
      end
  end

  player == "b" ? player = "w" : player = "b"
  if board.in_checkmate?(player)
    checkmate = true
  end

end
player == "b" ? player = "w" : player = "b"
puts "Congratulations, player #{player} is the winner!"
puts "The game is over, thank you for playing :)"


