module Chess
  class WhitePawn < Pieces
    def initialize(position)
      @position = position
      @team = "w"
    end

    def movement_pawn
      # 3 basic scenarios.
      # Consider the square in front empty if it is equal to nil
      # If it has an object inside, it will not be equal to nil
      # 1: Can move two or one spaces if in starting position
      # 2: One move forward
      # 3: Diagonal move to capture
      possible_moves = []
      row = @position[0]
      col = @position[1]
      # Code for movement scenario 1
      if row == 6
        possible_moves << [row - 1, col] if [row - 1, col].nil?
        possible_moves << [row - 2, col] if [row - 2, col].nil?
      elsif row < 6 # Code for movement scenario 2
        possible_moves << [row - 1, col] if [row - 1, col].nil?
      end
      # Code for scenario 3
      if [row - 1, col - 1] && col >= 0 # && team is black
        possible_moves << [row - 1, col - 1]
      elsif [row - 1, col + 1] && col <= 7 # && team is black
        possible_moves << [row - 1, col + 1]
      end
    end
  end
end