require_relative '../board'
require_relative '../all_pieces'
# module Chess
class Bishop < Pieces

  attr_reader :team
    def initialize(team, position)
      @position = position
      @team = team
      @piece = "bishop"
    end

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

    def capturable(chessboard)
      capture_pieces = []
      capture_pieces << enemy_up_right_check(chessboard)
      capture_pieces << enemy_low_right_check(chessboard)
      capture_pieces << enemy_low_left_check(chessboard)
      capture_pieces << enemy_up_left_check(chessboard)
      capture_pieces.compact
    end
end