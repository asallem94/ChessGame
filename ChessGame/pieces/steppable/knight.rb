require_relative '../piece'
require_relative 'steppable'

class Knight < Piece

  include Steppable

  def initialize(color, board, position)
    super
    @symbol = :kn
  end


  def get_possible_positions
    possible_positions = []
    [-1, 1,-2, 2].each do |f|
      [-1, 1,-2, 2].each do |l|
        possible_positions << [f, l] unless f.abs == l.abs
      end
    end
    possible_positions
  end
end
