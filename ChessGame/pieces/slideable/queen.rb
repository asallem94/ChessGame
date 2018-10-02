require_relative 'slideable'
require_relative '../piece'

class Queen < Piece
  include Slideable
  
  def initialize(color, board, position)
    super
    @symbol = :q
  end
end
