require_relative 'slideable'
require_relative '../piece'

class Queen < Piece
  include Slideable
  attr_reader :symbol
  def initialize(color, board, position)
    super
    @symbol = :q
  end
end
