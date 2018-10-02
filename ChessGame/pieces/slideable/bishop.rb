require_relative 'slideable'
require_relative '../piece'

class Bishop < Piece
  include Slideable

  def initialize(color, board, position)
    super
    @symbol = :b
  end
  def possible_moves
    diagonal_dirs
  end
end
