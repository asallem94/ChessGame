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
    symbol_hash = {nil => " ", :p => "p", :k => "+", :b => "t" , :kn => "$" , :q => "W", :r => "=" }
    color_hash = {"W" => :white, "B" => :black}
    # background = {true => :, false => :}
    puts ""

    spacer = "    "
    col_index = "#{spacer} #{spacer}"
    8.times do |i|
      col_index += "#{spacer}#{i}#{spacer}"
    end
    puts col_index
    puts ""
    (0..7).each do |row|
      str = "#{spacer}#{row}#{spacer}"
      str_spacing = ""

      (0..7).each do |col|
        piece = self.board[[row, col]]
        linespace = "#{spacer} #{spacer}"
        addition_str = "#{spacer}#{symbol_hash[piece.symbol].colorize(:color => color_hash[piece.color])}#{spacer}"
        if (col.even? && row.even?) ||(col.odd? && row.odd?)
          str += addition_str.on_light_black
          str_spacing += linespace.on_light_black
        else
          str += addition_str.on_light_cyan
          str_spacing += linespace.on_light_cyan
        end
      end
      puts "#{spacer} #{spacer}"+str_spacing
      puts str
      puts "#{spacer} #{spacer}"+str_spacing
    end
    puts ""

  end
end
