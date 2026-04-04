require_relative '../board'
require_relative '../all_pieces'
# module Chess
class Bishop < Pieces

    def initialize(team, position)
      @position = position
      @team = team
      
    end

    # Movement 1: The bishop can move diagonally in a straight 
    # line as long as there is empty space and it is within the
    # edges of the board 0 > x/y < 8
    # Movement 2: If the next diagonal piece is a piece from the 
    # opposite team, then it may move to that one position and 
    # capture the enemy piece
    # movement_bishop returns an array of positions e.g. [[5,3]]
    def movement_bishop(chessboard)
      all_possible_moves = []
      up_left = up_left_check(chessboard)
      up_right = up_right_check(chessboard)
      low_left = low_left_check(chessboard)
      low_right = low_right_check(chessboard)
      up_left.each { |val| all_possible_moves << val unless val == [] }
      up_right.each { |val| all_possible_moves << val unless val == [] }
      low_left.each { |val| all_possible_moves << val unless val == [] }
      low_right.each { |val| all_possible_moves << val unless val == [] }
      all_possible_moves
    end


end
# end