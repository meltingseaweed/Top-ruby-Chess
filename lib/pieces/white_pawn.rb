class WhitePawn < Pieces

  attr_reader :team, :piece
  def initialize(team, position)
    @position = position
    @team = team
    @piece = "white_pawn"
  end

  def movement_pawn(chessboard)
    possible_moves = []
    row = @position[0]
    col = @position[1]
    if row == 6
      possible_moves << [row - 1, col] if chessboard[row - 1][col].nil?
      possible_moves << [row - 2, col] if chessboard[row - 2][col].nil? && chessboard[row - 1][col].nil?
    elsif row < 6 
      possible_moves << [row - 1, col] if chessboard[row - 1][col].nil?
    end
    possible_moves
  end

  def capturable(chessboard)
    capturable_pieces = []
    row = @position[0]
    col = @position[1]
    if col.between?(1,6)
      left = chessboard[row - 1][col - 1]
      right = chessboard[row - 1][col + 1]
      if left != nil && left.team != @team
        capturable_pieces << [row - 1, col - 1]
      elsif right != nil && right.team != @team
        capturable_pieces << [row - 1, col + 1]
      end
    elsif col == 0
      right = chessboard[row - 1][col + 1]
      capturable_pieces << [row - 1, col + 1] if right != nil && right.team != @team
    elsif col == 7
      left = chessboard[row - 1][col - 1]
      capturable_pieces << [row - 1, col + 1] if left != nil && left.team != @team
    end
    capturable_pieces
  end
end