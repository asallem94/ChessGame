require_relative '../piece'
require_relative 'steppable'

class King < Piece
  include Steppable

  attr_reader :symbol
  def initialize(color, board, position)
    super
    @symbol = :k
  end
end
