module Slideable
  public
  def horizontal_dirs
    steps = []
    [[0,1],[0,-1],[-1,0],[1,0]].each do |d|
      p d
      p steps
        steps += grow_unblocked_moves_in_dir(d[0], d[1])
    end
    steps
  end

  def diagonal_dirs
    steps = []
    [-1, 1].each do |dx|
      [-1, 1].each do |dy|
        steps += grow_unblocked_moves_in_dir(dx, dy)
      end
    end
    steps
  end

  def moves
    # spaces to go to.
    # list of spaces.
    move_dirs
  end

  private
  def move_dirs


  end

  def grow_unblocked_moves_in_dir(dx, dy)
    # detect unblocked.
    opposite_color = {"B" => "W", "W" =>"B"}
    steps_in_direction = []
    i=1
    potential_pos = [(self.position[0] + dx), (self.position[1] + dy)]
    while in_board?(potential_pos) && self.color != board[potential_pos].color
      "Potential position : #{potential_pos}"
      steps_in_direction << potential_pos
      break if board[potential_pos].color == opposite_color[self.color]
      i+=1
      potential_pos = [self.position[0] + (dx*i), self.position[1] + (dy*i)]
    end
    steps_in_direction
  end

  # def possible_moves
  #   available_positions = []
  #   # p = self.position
  #   possible_positions = get_possible_positions
  #   possible_positions.each do |change|
  #     potential_pos = add_array(self.position, change)
  #     # debugger
  #     if self.color != board[potential_pos].color && in_board?(potential_pos)
  #       # debugger
  #       available_positions << potential_pos
  #     end
  #   end
  #
  #   available_positions
  # end

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
