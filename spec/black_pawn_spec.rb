# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/all_pieces'
require_relative '../lib/board'
require_relative '../lib/pieces/black_pawn'
require_relative '../lib/pieces/white_pawn'

RSpec.describe BlackPawn do
  describe 'Evaluates possible moves' do
    subject(:pawn_two) { BlackPawn.new("b", [1,2]) }
    subject(:pawn_three) { BlackPawn.new("b", [2,3]) }
    subject(:board) { Board.new }
    context 'will calculate only legal moves under basic circumstances' do
      it 'can move 1 or 2 spaces if in original start position' do
        moves = pawn_two.movement(board.chessboard)
        expect(moves).to eql([[2,2], [3,2]])
      end

      it 'can move 1 space forward when not in start position' do
        moves = pawn_three.movement(board.chessboard)
        expect(moves).to eql([[3,3]])
      end

      it 'cannot move forward when space in front is blocked' do
        board.chessboard[2][2] = BlackPawn.new("b", [3,2])
        moves = pawn_two.movement(board.chessboard)
        expect(moves).to eql([]) 
      end

      it 'can move diagonally 1 space to take an enemy piece' do
        board.chessboard[3][2] = WhitePawn.new("w", [3,2])
        capture = pawn_three.capturable(board.chessboard)
        expect(capture).to eql([[3,2]])
      end
    end

    context 'when pawn reaches the other side' do
      xit 'may be switched for another piece' do
        
      end
    end

  end
end