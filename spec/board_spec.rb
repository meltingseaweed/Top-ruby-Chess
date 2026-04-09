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
  describe 'Can setup the board' do
    it 'Can set up the board correctly' do
      board = Board.new
      board.set_up_chessboard
      binding.pry
      board.display_board
      expect(board.display).to include("| \u2658 |")
    end
  end

end