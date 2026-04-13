# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/board'
require_relative '../lib/all_pieces'
require_relative '../lib/pieces/bishop'

RSpec.describe Bishop do
  describe 'Evaluates possible moves' do
    subject(:bishop) { Bishop.new("w", [7,2]) }
    subject(:bishop_mid) { Bishop.new("w", [3,3]) }
    subject(:board) { Board.new }
    context 'will return legal moves under basic circumstances' do
      it 'can move diagonally upwards to the left' do
        moves = bishop.up_left_check(board.chessboard)
        expect(moves).to eql([[6,1], [5,0]])
      end
      it 'can move diagonally upwards to the right' do
        moves = bishop.up_right_check(board.chessboard)
        expect(moves).to eql([[6,3], [5,4], [4,5], [3,6], [2,7]])
      end
      it 'can move diagonally downwards to the left' do
        moves = bishop_mid.low_left_check(board.chessboard)
        expect(moves).to eql([[4,2], [5,1], [6,0]])
      end
      it 'can move diagonally downwards to the right' do
        moves = bishop_mid.low_right_check(board.chessboard)
        expect(moves).to eql([[4,4], [5,5], [6,6], [7,7]])
      end

      it 'will return 1 value then be blocked by a friendly piece' do
        board.chessboard[6][1] = Bishop.new("w", [6,1])
        board.chessboard[5][4] = Bishop.new("w", [5,4])
        moves = bishop.movement(board.chessboard)
        expect(moves).to eql([[6,3]])
      end
      it 'will return 3 values then be blocked by a friendly piece' do
        board.chessboard[2][4] = Bishop.new("w", [2,4])
        board.chessboard[2][2] = Bishop.new("w", [2,2])
        board.chessboard[4][2] = Bishop.new("w", [4,2])
        board.chessboard[7][7] = Bishop.new("w", [7,7])
        moves = bishop_mid.movement(board.chessboard)
        expect(moves).to eql([[4,4], [5,5], [6,6]])
      end

      it 'will return values in multiple directions' do
        board.chessboard[1][1] = Bishop.new("w", [1,1])
        board.chessboard[1][5] = Bishop.new("w", [1,5])
        board.chessboard[6][6] = Bishop.new("w", [6,6])
        board.chessboard[6][0] = Bishop.new("w", [6,0])
        moves = bishop_mid.movement(board.chessboard)
        expect(moves).to eql([[2,2], [2,4], [4,2], [5,1],[4,4],[5,5]])
      end
      
      it 'can return array of enemy pieces' do
        board.chessboard[1][1] = Bishop.new("w", [1,1])
        board.chessboard[1][5] = Bishop.new("b", [1,5])
        board.chessboard[6][6] = Bishop.new("b", [6,6])
        board.chessboard[6][0] = Bishop.new("w", [6,0])
        capture = bishop_mid.capturable(board.chessboard)
        expect(capture).to eql([[1,5], [6,6]])
      end
    end

  end
end