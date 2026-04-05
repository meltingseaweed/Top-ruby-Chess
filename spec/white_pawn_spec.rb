# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/all_pieces'
require_relative '../lib/board'
require_relative '../lib/pieces/white_pawn'
require_relative '../lib/pieces/black_pawn'

RSpec.describe WhitePawn do
  describe 'Evaluates possible moves' do
    subject(:pawn_two) { WhitePawn.new("w", [6,2]) }
    subject(:pawn_three) { WhitePawn.new("w", [5,3]) }
    subject(:board) { Board.new }
    context 'will calculate only legal moves under basic circumstances' do
      it 'can move 1 or 2 spaces if in original start position' do
        moves = pawn_two.movement_pawn(board.chessboard)
        expect(moves).to eql([[5,2], [4,2]])
      end

      it 'can move 1 space forward when not in start position' do
        moves = pawn_three.movement_pawn(board.chessboard)
        expect(moves).to eql([[4,3]])
      end

      it 'cannot move forward when space in front is blocked' do
        board.chessboard[5][2] = WhitePawn.new("w", [5,2])
        moves = pawn_two.movement_pawn(board.chessboard)
        expect(moves).to eql([]) 
      end

      it 'can move diagonally 1 space to take an enemy piece' do
        board.chessboard[4][4] = BlackPawn.new("b", [4,4])
        capture = pawn_three.capturable(board.chessboard)
        expect(capture).to eql([[4,4]])

      end
    end

    context 'when pawn reaches the other side' do
      xit 'may be switched for another piece' do
        
      end
    end

  end
end