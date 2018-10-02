require "byebug"

module Steppable
  def possible_moves
    available_positions = []
    # p = self.position
    possible_positions = get_possible_positions
    possible_positions.each do |change|
      potential_pos = add_array(self.position, change)
      # debugger
      if self.color != board[potential_pos].color && in_board?(potential_pos)
        # debugger
        available_positions << potential_pos
      end
    end

    available_positions
  end

  def in_board?(potential_pos)
     potential_pos[0].between?(0,7) && potential_pos[1].between?(0,7)
  end
  def add_array(a, b)
    c = []
    [0,1].each do |i|
      c << a[i] + b[i]
    end
    c
  end

end
