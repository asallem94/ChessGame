class Piece
  attr_accessor :position
  attr_reader :color, :board, :symbol

  def initialize(color, board, position)
    @position = position
    @board = board
    @color = color

  end
  def valid_moves
    # return [[self.position[0]+1,self.position[1]], [self.position[0]+2,self.position[1]]] # test
    piece_type = self.board[self.position]
    piece_type.possible_moves
  end

  # def to_s
  #
  # end

  def move_into_check?(end_pos)

  end
end
