require 'pry-byebug'
require_relative '../all_pieces'

class King
  
  def initialize(team, position)
    @team = team
    @position = position
  end

  def movement_king(chessboard)
    new_positions = []
    row = @position[0]
    col = @position[1]
    movement_array = [[-1,0], [-1,1], [0,1], [1,1], [1,0], [1,-1], [0,-1], [-1,-1]]
    movement_array.each do |x, y|
      new_row = row + x
      new_col = col + y
      if new_row.between?(0,7) && new_col.between?(0,7)
        new_positions << [new_row, new_col] if chessboard[new_row][new_col].nil?
        # Add to capture array if that position contains an enemy piece
      end
    end
    new_positions
  end
end