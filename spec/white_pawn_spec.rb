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
      xit 'can move 1 or 2 spaces if in original start position' do
        moves = pawn_two.movement_pawn(board.chessboard)
        expect(moves).to eql([[5,2], [4,2]])
      end

      xit 'can move 1 space forward when not in start position' do
        moves = pawn_three.movement_pawn(board.chessboard)
        expect(moves).to eql([[4,3]])
      end

      xit 'cannot move forward when space in front is blocked' do
        board.chessboard[5][2] = WhitePawn.new("w", [5,2])
        moves = pawn_two.movement_pawn(board.chessboard)
        expect(moves).to eql([]) 
      end

      xit 'can move diagonally 1 space to take an enemy piece' do
        board.chessboard[4][4] = BlackPawn.new("b", [4,4])
        capture = pawn_three.capturable(board.chessboard)
        expect(capture).to eql([[4,4]])

      end
    end

    context 'when pawn reaches the other side' do
      xit 'may be switched for another piece' do
        
      end
    end

    context 'for en passant' do 
      xit 'can add en passant location to legal capture array' do
        board.set_up_chessboard
        white = WhitePawn.new("w", [3,5])
        black = board.chessboard[1][4]
        board.chessboard[3][5] = white
        board.execute_move([3,4], black, board.chessboard)
        capture = white.capturable(board.chessboard, board.en_passant_b)
        binding.pry
        expect(capture).to eql([[2,4]])

      end

      it 'can capture via en passant' do
        board.set_up_chessboard
        white = WhitePawn.new("w", [3,5])
        black = board.chessboard[1][4]
        board.chessboard[3][5] = white
        capture_black = black.capturable(board.chessboard)
        board.execute_move([3,4], black, board.chessboard, capture_black)
        capture_white = white.capturable(board.chessboard, board.en_passant_b)
        board.execute_move([2,4], white, board.chessboard, capture_white)
        expect(board.chessboard[3][4]).to be(nil)
      end
    end

  end
end