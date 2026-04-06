# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/board'
require_relative '../lib/all_pieces'
require_relative '../lib/pieces/rook'

RSpec.describe Rook do
  describe 'Evaluates possible moves' do
    subject(:rook) { Rook.new("w", [7,0]) }
    subject(:rook_mid) { Rook.new("w", [3,3]) }
    subject(:board) { Board.new }
    context 'will return legal moves under basic circumstances' do
      it 'can move in a straight line to the left' do
        board.chessboard[3][0] = Rook.new("w", [3,0])
        moves = rook_mid.left_check(board.chessboard)
        expect(moves).to eql([[3,2], [3,1]])
      end
      it 'can move in a straight line to the right' do
        board.chessboard[3][6] = Rook.new("w", [3,6])
        moves = rook_mid.right_check(board.chessboard)
        expect(moves).to eql([[3,4], [3,5]])
      end
      it 'can move in a straight line downwards' do
        board.chessboard[7][3] = Rook.new("w", [7,3])
        moves = rook_mid.down_check(board.chessboard)
        expect(moves).to eql([[4,3], [5,3], [6,3]])
      end
      it 'can move in a straight line up' do
        board.chessboard[1][3] = Rook.new("w", [1,3])
        moves = rook_mid.up_check(board.chessboard)
        expect(moves).to eql([[2,3]])
      end

      it 'will return values in multiple directions' do
        board.chessboard[3][0] = Rook.new("w", [3,0])
        board.chessboard[1][3] = Rook.new("w", [1,3])
        board.chessboard[3][6] = Rook.new("w", [3,6])
        board.chessboard[6][3] = Rook.new("w", [6,3])
        moves = rook_mid.movement_rook(board.chessboard)
        expect(moves).to eql([[2,3], [3,4], [3,5], [4,3], [5,3], [3,2], [3,1]])
      end
    
    end
    context 'capturing enemy pieces' do 
      it 'can return an array of enemy pieces' do
        board.chessboard[3][0] = Rook.new("b", [3,0])
        board.chessboard[3][6] = Rook.new("b", [3,6])
        board.chessboard[1][3] = Rook.new("w", [1,3])
        capture_pieces = rook_mid.capturable(board.chessboard)
        expect(capture_pieces).to eql([[3,0], [3,6]])
      end
    end

  end
end