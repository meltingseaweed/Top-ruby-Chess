class BlackPawn < Pieces

  attr_reader :team
  def initialize(team, position)
    @position = position
    @team = team
  end

  def movement_pawn(chessboard)
    # 3 basic scenarios.
    # Consider the square in front empty if it is equal to nil
    # If a piece is there it will not be equal to nil
    # 1: Can move two or one spaces if in starting position
    # 2: One move forward
    # 3: Diagonal move to capture
    possible_moves = []
    row = @position[0]
    col = @position[1]
    # Code for movement scenario 1
    if row == 1
      possible_moves << [row + 1, col] if chessboard[row + 1][col].nil?
      possible_moves << [row + 2, col] if chessboard[row + 2][col].nil? && chessboard[row + 1][col].nil?
    elsif row > 1 # Code for movement scenario 2
      possible_moves << [row + 1, col] if chessboard[row + 1][col].nil?
    end
    # Code for scenario 3
    # if chessboard[row - 1][col - 1] && col > 0 # && team is black
    #   capture_array << [row - 1, col - 1]
    # elsif chessboard[row - 1][col + 1] && col < 7 # && team is black
    #   capture_array << [row - 1, col + 1]
    # end
    possible_moves
  end

  def capturable(chessboard)
    binding.pry
    capturable_pieces = []
    row = @position[0]
    col = @position[1]
    if col.between?(1,6)
      left = chessboard[row + 1][col - 1]
      right = chessboard[row + 1][col + 1]
      if left != nil && left.team != @team
        capturable_pieces << [row + 1, col - 1]
      elsif right != nil && right.team != @team
        capturable_pieces << [row + 1, col + 1]
      end
    elsif col == 0
      right = chessboard[row + 1][col + 1]
      capturable_pieces << [row + 1, col + 1] if right != nil && right.team != @team
    elsif col == 7
      left = chessboard[row + 1][col - 1]
      capturable_pieces << [row + 1, col + 1] if left != nil && left.team != @team
    end
    capturable_pieces
  end
end