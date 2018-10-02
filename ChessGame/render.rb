require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :board#, :cursor
  def initialize(board)
    @board = board
    # @cursor = Cursor.new([0,0], self.board)
    render
  end

  def render
    symbol_hash = {nil => " ", :p => "p", :k => "+", :b => "t", :kn => "$", :q => "W", :r => "=" }
    puts ""

    puts "--------------------------------"
    (0..7).each do |row|
      str = "|"
      (0..7).each do |col|
        piece = self.board[[row, col]]
        str += " #{symbol_hash[piece.symbol]} |"
      end

      puts str
      puts "--------------------------------"
    end
    puts ""

  end
end
