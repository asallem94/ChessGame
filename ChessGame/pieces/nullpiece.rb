require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  attr_reader :symbol

  include Singleton
  def initialize
    @color = nil
    # @board = nil
    # @position = nil
    @symbol = nil
  end
end
