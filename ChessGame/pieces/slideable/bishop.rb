require_relative 'slideable'
require_relative '../piece'

class Bishop < Piece
  include Slideable
  attr_reader :symbol
  def initialize(color, board, position)
    super
    @symbol = :b
  end
end
