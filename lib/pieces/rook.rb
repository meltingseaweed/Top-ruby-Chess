require_relative '../all_pieces'

class Rook < Pieces

  attr_reader :team, :piece, :move_count
  attr_accessor :position
  def initialize(team, position)
  @team = team
  @position = position
  @piece = "rook"
  @move_count = 0
  end

  def movement(chessboard)
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

  def capturable(chessboard)
    capture_pieces = []
    capture_pieces << up_enemy_check(chessboard)
    capture_pieces << left_enemy_check(chessboard)
    capture_pieces << down_enemy_check(chessboard)
    capture_pieces << right_enemy_check(chessboard)
    capture_pieces.compact
  end
end