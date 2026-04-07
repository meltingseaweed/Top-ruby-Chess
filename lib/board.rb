# module Chess
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/white_pawn'
require_relative 'pieces/black_pawn'  

class Board

    attr_reader :chessboard

    def initialize
      @chessboard = Array.new(9) { Array.new(9) }
      @current_white
      @current_black
      @captured_white
      @captured_black
      @player
    end

    def set_up_chessboard
      @chessboard[0][0] = Rook.new("b", [0,0])
      @chessboard[0][7] = Rook.new("b", [0,7])
      @chessboard[7][0] = Rook.new("w", [7,0])
      @chessboard[7][7] = Rook.new("w", [7,7])
      @chessboard[0][1] = Knight.new("b", [0,1])
      @chessboard[0][6] = Knight.new("b", [0,6])
      @chessboard[7][1] = Knight.new("w", [7,1])
      @chessboard[7][6] = Knight.new("w", [7,6])
      @chessboard[0][2] = Bishop.new("b", [0,2])
      @chessboard[0][5] = Bishop.new("b", [0,5])
      @chessboard[7][2] = Bishop.new("w", [7,2])
      @chessboard[7][5] = Bishop.new("w", [7,5])
      @chessboard[0][3] = Queen.new("b", [0,3])
      @chessboard[7][3] = Queen.new("w", [7,3])
      @chessboard[0][4] = King.new("b", [0,4])
      @chessboard[7][4] = King.new("w", [7,4])
      count = 0
      8.times do 
        @chessboard[1][count] = BlackPawn.new("b", [1, count])
        @chessboard[6][count] = WhitePawn.new("w", [6, count])
        count += 1
      end
      count = 0
      letter = 97
      8.times do 
        @chessboard[count][8] = "| #{count} |"
        @chessboard[8][count] = "| #{(letter+count).chr} |"
        count += 1
      end
      @chessboard[8][8] = "|   |"
    end
    
      # Change so that array is filled with actual objects rather
      # than strings.
      # Then, create a display function which will update the icon
      # depending on the contents of each array pieces :)
      # So the code below will be altered for sure. 
      # 
    def create_display_practice
      @chessboard = Array.new(8) { Array.new(9, "|   |") }
      @chessboard[0][0] = @chessboard[0][7] = "| \u265C |"
      @chessboard[0][1] = @chessboard[0][6] = "| \u265E |"
      @chessboard[0][2] = @chessboard[0][5] = "| \u265D |"
      @chessboard[0][3] = "| \u265B |"
      @chessboard[0][4] = "| \u265A |"
      @chessboard[1] = @chessboard[1].map { |piece| piece = "| \u265F |" }
      @chessboard[7][0] = @chessboard[7][7] = "| \u2656 |"
      @chessboard[7][1] = @chessboard[7][6] = "| \u2658 |"
      @chessboard[7][2] = @chessboard[7][5] = "| \u2657 |"
      @chessboard[7][3] = "| \u2655 |"
      @chessboard[7][4] = "| \u2654 |"
      @chessboard[6] = @chessboard[6].map { |piece| piece = "| \u2659 |" }
      count = 8
      @chessboard.each do |row|
        row[8] = "| #{count} |"
        count -= 1
      end
    end
  

    def display_board
      @chessboard.each do |row|
        row.each do |value|
          print value
        end
        puts ""
      end
      puts "----------------------------------------"
      puts "| a || b || c || d || e || f || g || h |"
    end
  end
# end