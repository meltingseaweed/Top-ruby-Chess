# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/board'
require_relative '../lib/all_pieces'
require_relative '../lib/pieces/king'

RSpec.describe King do
  describe 'Evaluates possible moves' do
    subject(:king) { King.new("w", [7,4]) }
    subject(:king_two) { King.new("w", [6,4]) }
    subject(:board) { Board.new }
    context 'will return legal moves' do
      it 'Can return no moves on the first turn' do
        board.chessboard[7][3] = King.new("w", [7,3])
        board.chessboard[7][5] = King.new("w", [7,5])
        board.chessboard[6][3] = King.new("w", [6,3])
        board.chessboard[6][4] = King.new("w", [6,4])
        board.chessboard[6][5] = King.new("w", [6,5])
        moves = king.movement_king(board.chessboard)
        expect(moves).to eql([])
      end
      it 'Can return moves in all directions if no pieces surround it' do
        moves = king_two.movement_king(board.chessboard)
        expect(moves).to eql([[5,4], [5,5], [6,5], [7,5], [7,4], [7,3], [6,3], [5,3]])
      end

      it 'Can return array of capturable pieces' do
        board.chessboard[7][3] = King.new("b", [7,3])
        board.chessboard[7][5] = King.new("w", [7,5])
        board.chessboard[6][3] = King.new("b", [6,3])
        board.chessboard[6][4] = King.new("b", [6,4])
        board.chessboard[6][5] = King.new("b", [6,5])
        capture = king.capturable(board.chessboard)
        expect(capture).to eql([[6,4], [6,5], [7,3], [6,3]])
      end
    end

    context 'correctly finds check' do
      xit 'Correctly finds check to be true' do
        
      end

      xit 'Correctly finds check to be false' do
        
      end
    end

    context 'Correctly finds checkmate' do
      xit 'Correctly finds checkmate and ends the game' do
        
      end
      xit 'Correctly finds checkmate to be false' do
        
      end
    end

    context 'Castling' do
      xit 'Can find whether castling is a legal move' do
        
      end
      xit 'Can correctly castle to the left' do
        
      end
      xit 'Can correctly castle to the right' do
        
      end
      xit 'Does not allow castling when the king has moved' do
        
      end
      xit 'Does not allow castling when the rook has moved' do
        
      end
    end
  end
end