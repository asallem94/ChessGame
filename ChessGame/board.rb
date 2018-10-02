require_relative "pieces/piece"

#Steppable
require_relative "pieces/steppable/king"
require_relative "pieces/steppable/knight"
#Slideable
require_relative "pieces/slideable/queen"
require_relative "pieces/slideable/bishop"
require_relative "pieces/slideable/rook"
#Unique
require_relative "pieces/nullpiece"
require_relative "pieces/pawn"
class CantMoveError < StandardError
  def message
    puts "Change your starting position!"
  end
end

class ValidMoveError < StandardError
  def message
    puts "Not a valid move!"
  end
end

class Board
  attr_accessor :grid
  def initialize()
    @grid = Array.new(8){Array.new(8)}
    setup_board
  end

  def move_piece(color,start_pos, end_pos)
    moving_piece = self[start_pos]
    unless color == moving_piece.color
      raise CantMoveError
    end

    unless moving_piece.valid_moves.include?(end_pos)
      raise ValidMoveError
    end

    self[end_pos] = moving_piece
    moving_piece.position = end_pos
    self[start_pos] = NullPiece.instance


  end
  def inspect

  end
  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []= (pos, piece_val)
    x,y = pos
    grid[x][y] = piece_val
  end

  # private
  def setup_board
    setup_null_piece
    setup_pawns
    set_main_pieces
  end

  def setup_null_piece
    (2..5).each do |row|
      (0..7).each do |col|
        self.grid[row][col] = NullPiece.instance
      end
    end
  end
  def setup_pawns
    (0..7).each do |col|
      self.grid[1][col] = Pawn.new("W", self, [1,col])
      self.grid[6][col] = Pawn.new("B", self, [6,col])
    end
  end


  def set_main_pieces
    main_pieces_seq = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    main_pieces_seq.each.with_index do |piece_type_class, col|
      self.grid[0][col] = piece_type_class.new("W", self, [0,col])
      self.grid[7][col] = piece_type_class.new("B", self, [7,col])
    end

  end
end
