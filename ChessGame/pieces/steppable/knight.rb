require_relative '../piece'
require_relative 'steppable'

class Knight < Piece

  include Steppable

  
  def initialize(color, board, position)
    super
    @symbol = :kn
  end
end
