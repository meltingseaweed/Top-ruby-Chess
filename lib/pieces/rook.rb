class Rook

  def initialize(team, position)
  @team = team
  @position = position
  end

  def movement_rook(chessboard)
    all_possible_moves = []
    upwards = up_check(chessboard)
    right = right_check(chessboard)
    downwards = down_check(chessboard)
    left = left_check(chessboard)
    upwards.each { |val| all_possible_moves << val unless val == [] }
    right.each { |val| all_possible_moves << val unless val == [] }
    downwards.each { |val| all_possible_moves << val unless val == [] }
    left.each { |val| all_possible_moves << val unless val == [] }
    all_possible_moves
  end


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
end