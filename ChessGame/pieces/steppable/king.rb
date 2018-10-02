require_relative '../piece'
require_relative 'steppable'

class King < Piece
  include Steppable

  def initialize(color, board, position)
    super
    @symbol = :k
  end

  def get_possible_positions
    possible_positions = []
    [-1, 0, 1].each do |f|
      [-1, 0, 1].each do |l|
        possible_positions << [f, l] unless f==0 && l==0
      end
    end
    possible_positions
  end
  
end
