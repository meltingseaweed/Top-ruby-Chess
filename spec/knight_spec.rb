# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/board'
require_relative '../lib/all_pieces'
require_relative '../lib/pieces/knight'

RSpec.describe Knight do
  describe 'Evaluate possible moves' do
    subject(:knight_one) { Knight.new("w", [7,1]) }
    subject(:knight_mid) { Knight.new("w", [3,3]) }
    subject(:board) { Board.new }
    context 'will return all legal moves' do
      it 'can return the first two initial moves' do
        board.chessboard[6][3] = Knight.new("w", [6,3])
        moves = knight_one.movement(board.chessboard)
        expect(moves).to eql([[5,0], [5,2]])
      end

      it 'can return multiple moves into empty spaces' do
        board.chessboard[1][4] = Knight.new("w", [1,4])
        board.chessboard[1][2] = Knight.new("w", [1,2])
        moves = knight_mid.movement(board.chessboard)
        expect(moves).to eql([[4,5], [5,4], [5,2], [4,1], [2,1], [2,5]])
      end

      it 'can return array of capturable pieces' do
        board.chessboard[5][0] = Knight.new("b", [5,0])
        capture = knight_one.capturable(board.chessboard)
        expect(capture).to eql([[5,0]])
      end

    end
  end
end