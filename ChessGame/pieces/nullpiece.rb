require_relative 'piece'
class NullPiece < Piece
  attr_reader :symbol
  def initialize(color, board, position)
    super
    @symbol = nil
  end
end
