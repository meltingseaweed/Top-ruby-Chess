# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/board'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/white_pawn'
require_relative '../lib/pieces/black_pawn'  

RSpec.describe Board do 
  describe 'setting up the board' do
    subject(:board) {Board.new}
    context 'can set up different pieces' do
    xit 'Can set up all black pawns' do
    end

    xit 'Can set up all white pawns' do
      board = Boa
    end

    xit 'Can set up bishops' do
      
    end
    xit 'Can set up kings' do
      
    end

    xit 'Can set up queens' do
      
    end

    xit 'Can set up knights' do 
      
    end

    xit 'Can set up rooks' do
      
    end
  end
  end

  describe 'checking for check' do 
    subject(:board) { Board.new }
    context 'will find check when it is true' do
      it 'finds check from rook' do
        board.chessboard[3][3] = King.new("b", [3,3])
        board.remaining_black << board.chessboard[3][3]
        board.chessboard[3][7] = Rook.new("w", [3,7])
        board.remaining_white << board.chessboard[3][7]
        value = board.check_check("b")
        expect(value).to be(true)
      end
    end
  end

end