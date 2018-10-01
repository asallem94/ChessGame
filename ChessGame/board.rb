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
class NoPiece < StandardError
  def message
    puts "There is no piece."
  end
end
class Board
  attr_accessor :grid
  def initialize()
    @grid = Array.new(8){Array.new(8)}
    setup_board
  end

  def move_piece(color,start_pos, end_pos)
    begin

    rescue

    end
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
        self.grid[row][col] = NullPiece.new(nil, self, [row,col])
      end
    end
  end
  def setup_pawns
    (0..7).each do |col|
      self.grid[1][col] = Pawn.new("W", self, [2,col])
      self.grid[6][col] = Pawn.new("B", self, [7,col])
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
