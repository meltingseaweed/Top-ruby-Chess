require 'pry-byebug'
require_relative '../all_pieces'

class Queen < Pieces
  
  def initialize(team, position)
    @team = team
    @position = position
  end

  def movement_queen(chessboard)
    all_possible_moves = []
    upwards = up_check(chessboard)
    up_right = up_right_check(chessboard)
    right = right_check(chessboard)
    down_right = low_right_check(chessboard)
    downwards = down_check(chessboard)
    down_left = low_left_check(chessboard)
    left = left_check(chessboard)
    up_left = up_left_check(chessboard)
    
    upwards.each { |val| all_possible_moves << val unless val == [] }
    up_right.each { |val| all_possible_moves << val unless val == [] }
    right.each { |val| all_possible_moves << val unless val == [] }
    down_right.each { |val| all_possible_moves << val unless val == [] }
    downwards.each { |val| all_possible_moves << val unless val == [] }
    down_left.each { |val| all_possible_moves << val unless val == [] }
    left.each { |val| all_possible_moves << val unless val == [] }
    up_left.each { |val| all_possible_moves << val unless val == [] }
    all_possible_moves
  end
end