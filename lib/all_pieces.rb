class Pieces

  def left_check(chessboard)
    possible_moves = []
    row = @position[0]
    col = @position[1] - 1
    while col.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    col -= 1
    end
    possible_moves
  end

  def right_check(chessboard)
    possible_moves = []
    row = @position[0]
    col = @position[1] + 1
    while col.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    col += 1
    end
    possible_moves
  end

  def down_check(chessboard)
    possible_moves = []
    row = @position[0] + 1
    col = @position[1]
    while row.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    row += 1
    end
    possible_moves
  end

  def up_check(chessboard)
    possible_moves = []
    row = @position[0] - 1
    col = @position[1]
    while row.between?(0,7)
      if chessboard[row][col].nil?
        possible_moves << [row, col]
      elsif col.nil? # Contains enemy piece. 
        # (now just placeholder checking nil conditional)
        #Add to capture array
      else
        break
      end
    row -= 1
    end
    possible_moves
  end

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
