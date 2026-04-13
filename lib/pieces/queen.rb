require 'pry-byebug'
require_relative '../all_pieces'

class Queen < Pieces
  
  attr_reader :team, :piece

  def initialize(team, position)
    @team = team
    @position = position
    @piece = "queen"
  end

  def movement(chessboard)
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

  def capturable(chessboard)
    capture_pieces = []
    capture_pieces << up_enemy_check(chessboard)
    capture_pieces << left_enemy_check(chessboard)
    capture_pieces << down_enemy_check(chessboard)
    capture_pieces << right_enemy_check(chessboard)
    capture_pieces << enemy_up_right_check(chessboard)
    capture_pieces << enemy_low_right_check(chessboard)
    capture_pieces << enemy_low_left_check(chessboard)
    capture_pieces << enemy_up_left_check(chessboard)
    capture_pieces.compact
  end
end