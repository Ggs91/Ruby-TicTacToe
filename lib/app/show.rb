require_relative 'board'
class Show
  def show_board(board, round)
    system 'clear'
    puts "-------------- Round #{round} ----------------"
    board.display
  end
end
