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

    possible_moves = []
    count = 1
    
    #Method for upper left check
    row = @position[0] - 1
    col = @position[1] - 1
    until col < 0
      up_left = [row, col]
      if up_left[0].between?(0,7) && up_left[1].between?(0,7)
        if up_left.nil?
          possible_moves << up_left
        elsif up_left.nil? # Contains enemy piece. 
          # (now just placeholder checking nil conditional)
          #Add to capture array
        else
          break
        end
      end
      col -= 1
      row -= 1
    end

    # Method for upper right check
    row = @position[0] - 1
    col = @position[1] + 1
    until col > 7
      up_right = [row, col]
      if up_right[0].between?(0,7) && up_right[1].between?(0,7)
        if up_right.nil?
          possible_moves << up_right
        elsif up_right.nil? # Contains enemy piece. 
          # (now just placeholder checking nil conditional)
          #Add to capture array
        else
          break
        end
      end
      col += 1
      row -= 1
    end

  end
end