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
      xit 'can move 1 or 2 spaces if in original start position' do
        moves = pawn_two.movement(board.chessboard)
        expect(moves).to eql([[2,2], [3,2]])
      end

      xit 'can move 1 space forward when not in start position' do
        moves = pawn_three.movement(board.chessboard)
        expect(moves).to eql([[3,3]])
      end

      xit 'cannot move forward when space in front is blocked' do
        board.chessboard[2][2] = BlackPawn.new("b", [3,2])
        moves = pawn_two.movement(board.chessboard)
        expect(moves).to eql([]) 
      end

      xit 'can move diagonally 1 space to take an enemy piece' do
        board.chessboard[3][2] = WhitePawn.new("w", [3,2])
        capture = pawn_three.capturable(board.chessboard)
        expect(capture).to eql([[3,2]])
      end
    end

    context 'when pawn reaches the other side' do
      xit 'may be switched for another piece' do
        
      end
    end

    context 'for en passant' do 
      xit 'can add en passant location to capture array' do
        board.set_up_chessboard
        black = BlackPawn.new("b", [4,3])
        white = board.chessboard[6][4]
        board.chessboard[4][3] = black
        binding.pry
        capture = white.capturable(board.chessboard, board.en_passant_b)
        board.execute_move([4,4], white, board.chessboard, capture)
        capture = black.capturable(board.chessboard, board.en_passant_w)
        binding.pry
        expect(capture).to eql([[5,4]])

      end

      it 'can capture via en passant' do
        board.set_up_chessboard
        white = board.chessboard[6][4]
        black = BlackPawn.new("b", [4,3])
        board.chessboard[4][3] = black
        capture_white = white.capturable(board.chessboard, board.en_passant_b)
        board.execute_move([4,4], white, board.chessboard, capture_white)
        capture_black = black.capturable(board.chessboard, board.en_passant_w)
        binding.pry
        board.execute_move([5,4], black, board.chessboard, capture_black)
        expect(board.chessboard[4][4]).to be(nil)
      end
    end

  end
end