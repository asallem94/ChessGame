require_relative 'render'

b = Board.new()

Display.new(b)
# move Pawn
b.move_piece("W",[1,0], [3,0])
b.move_piece("W",[1,1], [3,1])
# move knight
b.move_piece("W",[0,1], [2,0])
b.move_piece("W",[2,0], [4,1])
#move rook
b.move_piece("W",[0,0], [2,0])
b.move_piece("W",[2,0], [2,4])
# move Bishop
b.move_piece("W",[0,2], [2,0])
# move Queen
b.move_piece("W",[0,3], [0,0])
# move Bishop
b.move_piece("W",[0,0], [4,4])
Display.new(b)

## Pawn missing conditional not to do two steps over piece

 puts "Available positions : #{b[[4,4]].valid_moves}" #[[0,1],[1,0][2,0]]
