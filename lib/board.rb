# module Chess
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/white_pawn'
require_relative 'pieces/black_pawn'  
require_relative 'chess_methods'

class Board

    include ChessMethods
    attr_reader :chessboard
    attr_accessor :remaining_white, :remaining_black

    def initialize
      @chessboard = Array.new(9) { Array.new(9) }
      @remaining_white = []
      @remaining_black = []
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
      while count < 9 do 
        @chessboard[1][count] = BlackPawn.new("b", [1, count])
        @chessboard[6][count] = WhitePawn.new("w", [6, count])
        count += 1
      end
      count = 0
      row = 8
      letter = 97
      while count < 9 do 
        @chessboard[count][8] = "| #{row - count} |"
        @chessboard[8][count] = "| #{(letter+count).chr} |"
        count += 1
      end
      @chessboard.each do |row|
        row.each do |val|
          if val.is_a?(String) == false
            if val != nil && val.team == "w"
            @remaining_white << val
            elsif val != nil && val.team == "b"
            @remaining_black << val
            end 
          end
        end
      end 
      binding.pry
    end
    
    def display_board
      display = @chessboard.map(&:clone)
      display = display.map do |row|
        row.map do |val|
          if val.nil?
            val = "|   |"
          else
            if val.is_a?(String)
              val = val
            elsif val.team == "b"
              case val.piece
              when "black_pawn" then val = "| \u265F |"
              when "rook" then val = "| \u265C |"
              when "knight" then val = "| \u265E |"
              when "bishop" then val = "| \u265D |"
              when "queen" then val = "| \u265B |"
              when "king" then val = "| \u265A |"
              end
            elsif val.team == "w"
              case val.piece
              when "white_pawn" then val = "| \u2659 |"
              when "rook" then val = "| \u2656 |"
              when "knight" then val = "| \u2658 |"
              when "bishop" then val = "| \u2657 |"
              when "queen" then val = "| \u2655 |"
              when "king" then val = "| \u2654 |"
              end
            end
          end
      
        end
      end
      display.each do |row|
        print "#{row}\n"
      end
    end

    def check_check(player)
      player == "w" ? enemy_black = true : enemy_black = false
      if enemy_black
        binding.pry
        enemy_range = []
        w_king = @remaining_white.select { |piece| piece.piece == "king" } 
        @remaining_black.each do |piece|
          piece.capturable(@chessboard).each { |pos| enemy_range << pos unless pos == []}
        end
        if enemy_range.include?(w_king[0].position)
          return true
        else
          return false
        end
      else
        binding.pry
        enemy_range = []
        b_king = @remaining_black.select { |piece| piece.piece == "king" }
        @remaining_white.each do |piece|
          piece.capturable(@chessboard).each { |pos| enemy_range << pos unless pos == []}
        end
        if enemy_range.include?(b_king[0].position)
          return true
        else
          return false
        end
      end


    end
end