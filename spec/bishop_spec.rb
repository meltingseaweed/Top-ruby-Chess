# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/board'
require_relative '../lib/all_pieces'
require_relative '../lib/pieces/bishop'

RSpec.describe Bishop do
  describe 'Evaluates possible moves' do
    subject(:bishop) { Bishop.new("w", [6,2]) }
    subject(:bishop_mid) { Bishop.new("b", [3,3]) }
    subject(:board) { Board.new }
    context 'will return legal moves under basic circumstances' do
      it 'can move diagonally upwards to the left' do
        moves = bishop.up_left_check(board.chessboard)
        expect(moves).to eql([[5,1], [4,0]])
      end
      it 'can move diagonally upwards to the right' do
        moves = bishop.up_right_check(board.chessboard)
        expect(moves).to eql([[5,3], [4,4], [3,5], [2,6], [1,7]])
      end
      it 'can move diagonally downwards to the left' do
        moves = bishop_mid.low_left_check(board.chessboard)
        expect(moves).to eql([[4,2], [5,1], [6,0]])
      end
      it 'can move diagonally downwards to the right' do
        moves = bishop_mid.low_right_check(board.chessboard)
        expect(moves).to eql([[4,4], [5,5], [6,6], [7,7]])
      end

      xit 'will return 1 value then be blocked by a friendly piece' do
      end
      xit 'will return 3 values then be blocked by a friendly piece' do
      end
      xit 'cannot move when all directions are blocked or at board edges' do 
      end
      xit 'can move diagonally 1 space to take an enemy piece' do
      end
    end

  end
end