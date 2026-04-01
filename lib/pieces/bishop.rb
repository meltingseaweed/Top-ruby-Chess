require_relative '../board'
# module Chess
class Bishop

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
    def movement_bishop
      all_possible_moves = up_left_check
      all_possible_moves << up_right_check
      all_possible_moves << low_left_check
      all_possible_moves << low_right_check
      all_possible_moves
    end

    #Method for upper left check
  def up_left_check(chessboard)
    possible_moves = []
    row = @position[0] - 1
    col = @position[1] - 1
    while row.between?(0,7) && col.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    col -= 1
    row -= 1
    end
    possible_moves
  end

    # Method for upper right check
  def up_right_check(chessboard)
    possible_moves = []
    col = @position[1] + 1
    row = @position[0] - 1
    while row.between?(0,7) && col.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    col += 1
    row -= 1
    end
    possible_moves
  end

  def low_right_check(chessboard)
    possible_moves = []
    row = @position[0] + 1
    col = @position[1] + 1
    while row.between?(0,7) && col.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    col += 1
    row += 1
    end
    possible_moves
  end

  def low_left_check(chessboard)
    possible_moves = []
    col = @position[1] - 1
    row = @position[0] + 1
    while row.between?(0,7) && col.between?(0,7)
        if chessboard[row][col].nil?
          possible_moves << [row, col]
        elsif col.nil? # Contains enemy piece. 
          # (now just placeholder checking nil conditional)
          #Add to capture array
        else
          break
        end
      col -= 1
      row += 1
    end
    possible_moves
  end
end
# end