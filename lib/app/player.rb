class Player
  attr_accessor :name, :turn, :points
  attr_reader :pawn_shape

  def initialize(name, pawn_shape)
    @name, @pawn_shape = name, pawn_shape
    @turn = false
    @points = 0
  end

  def make_a_move(selected_case)
    selected_case.content = pawn_shape
  end

end
