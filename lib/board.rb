module Chess
  class Board
    def initialize
      @chessboard = Array.new(8) { Array.new(8, "|   |") }
    end
  end
end