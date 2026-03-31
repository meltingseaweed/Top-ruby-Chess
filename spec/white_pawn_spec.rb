# frozen_string_literal: true
require 'pry-byebug'
require_relative '../lib/all_pieces'
require_relative '../lib/pieces/white_pawn'

Rspec.describe WhitePawn do
  describe 'Evaluates possible moves' do
    subject(:white_pawn) { WhitePawn.new }
    context 'will calculate only legal moves under basic circumstances' do
      xit 'can move 1 or 2 spaces if in original start position' do
      end

      xit 'can move 1 space forward unless blocked' do
      end
      xit 'cannot move forward when space in front is blocked' do 
      end
      xit 'can move diagonally 1 space to take an enemy piece' do
      end
    end

    context 'when pawn reaches the other side' do
      xit 'may be switched for another piece' do
        
      end
    end

  end
end