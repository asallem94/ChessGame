require_relative 'piece'

class Pawn < Piece

  # attr_reader :symbol # inherited from Piece
  def initialize(color, board, position)
    super
    @symbol = :p
  end
  def move_dirs
    available_moves = [[self.position[0]+forward_dir, self.position[1]]]
    available_moves << forward_steps if at_start_row?
    available_moves.each { |pos| available_moves.delete(pos) unless board[pos].color == nil  }
    available_moves += side_attack

    available_moves
  end

  private
  def at_start_row?
    (self.color == "W" && self.position[0] == 1) || (self.color == "B" && self.position[0] == 6)
  end
  def forward_dir
    return 1 if color == "W"
    return -1 if color == "B"
  end
  def forward_steps
    [self.position[0]+forward_dir*2, self.position[1]] if at_start_row?
  end
  def side_attack
    l_pos = [self.position[0]+forward_dir, self.position[1]-1]
    r_pos = [self.position[0]+forward_dir, self.position[1]+1]

    left_attack = self.board[l_pos]
    right_attack = self.board[r_pos]

    attack_possibilities = []
    if l_pos[1]>-1
      if left_attack.color != self.color && !left_attack.color.nil?
        attack_possibilities << l_pos
      end
    end

    if r_pos[1] < 8
      if right_attack.color != self.color && !right_attack.color.nil?
        attack_possibilities << r_pos
      end
    end

    attack_possibilities
  end
end
