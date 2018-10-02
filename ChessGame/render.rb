require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display
  attr_reader :board#, :cursor
  def initialize(board)
    @board = board
    # @cursor = Cursor.new([0,0], self.board)
    render
  end

  def render
    symbol_hash = {nil => "   ", :p => " p ", :k => " + ", :b => " t " , :kn => " $ " , :q => " W ", :r => " = " }
    color_hash = {"W" => :orange, "B" => :black}
    background = {true => :light_yellow, false => :light_green}
    puts ""

    puts "--------------------------------"
    (0..7).each do |row|
      str = "|"
      (0..7).each do |col|
        piece = self.board[[row, col]]
        str += "#{symbol_hash[piece.symbol].colorize(:color => color_hash[piece.color]).colorize(:background => background[(col.even? && row.even?) ||(col.odd? && row.odd?)])}|"
      end

      puts str
      puts "--------------------------------"
    end
    puts ""

  end
end
