class Piece
  attr_accessor :position
  attr_reader :color, :board, :symbol

  def initialize(color, board, position)
    @position = position
    @board = board
    @color = color

  end
  def valid_moves
    piece_type = self.board[self.position]
    piece_type.possible_moves
  end


  def move_into_check?(end_pos)

  end
end
