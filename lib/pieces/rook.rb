require_relative '../all_pieces'

class Rook < Pieces

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
end