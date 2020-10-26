require_relative 'board_case'
class Board
  attr_reader :boardcases

  def initialize
    @boardcases = [
      @a1 = BoardCase.new("A1"),
      @a2 = BoardCase.new("A2"),
      @a3 = BoardCase.new("A3"),
      @b1 = BoardCase.new("B1"),
      @b2 = BoardCase.new("B2"),
      @b3 = BoardCase.new("B3"),
      @c1 = BoardCase.new("C1"),
      @c2 = BoardCase.new("C2"),
      @c3 = BoardCase.new("C3"),
    ]

    @win_cases = [
      [@a1, @a2, @a3],
      [@b1, @b2, @b3],
      [@c1, @c2, @c3],
      [@a1, @b1, @c1],
      [@a2, @b2, @c2],
      [@a3, @b3, @c3],
      [@a1, @b2, @c3],
      [@a3, @b2, @c1],
    ]
  end

  def display
    puts "  1 2 3 \nA #{@a1.content}|#{@a2.content}|#{@a3.content}\nB #{@b1.content}|#{@b2.content}|#{@b3.content}\nC #{@c1.content}|#{@c2.content}|#{@c3.content}\n\n"
  end

  def got_win_case?
    @win_cases.any? { |win_case_array| win_case_array.all? { |boardcase| boardcase.content == "X" } || win_case_array.all? { |boardcase| boardcase.content == "O" } }
  end

  def is_full?
    boardcases.all? { |boardcase| boardcase.content != " "}
  end
end
