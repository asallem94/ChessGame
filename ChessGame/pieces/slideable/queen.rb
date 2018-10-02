require_relative 'slideable'
require_relative '../piece'

class Queen < Piece
  include Slideable

  def initialize(color, board, position)
    super
    @symbol = :q
  end
  def possible_moves
    horizontal_dirs+diagonal_dirs
  end
end
