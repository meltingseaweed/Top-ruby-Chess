module Chess
  class Board
    def initialize
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
end