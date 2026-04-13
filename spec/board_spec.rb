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

end