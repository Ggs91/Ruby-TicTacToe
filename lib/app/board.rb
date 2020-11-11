require_relative 'board_case'
class Board
  attr_reader :boardcases

  def initialize
    @boardcases = [
      @a1 = BoardCase.new('A1'),
      @a2 = BoardCase.new('A2'),
      @a3 = BoardCase.new('A3'),
      @b1 = BoardCase.new('B1'),
      @b2 = BoardCase.new('B2'),
      @b3 = BoardCase.new('B3'),
      @c1 = BoardCase.new('C1'),
      @c2 = BoardCase.new('C2'),
      @c3 = BoardCase.new('C3')
    ]

    @win_cases = [
      [@a1, @a2, @a3],
      [@b1, @b2, @b3],
      [@c1, @c2, @c3],
      [@a1, @b1, @c1],
      [@a2, @b2, @c2],
      [@a3, @b3, @c3],
      [@a1, @b2, @c3],
      [@a3, @b2, @c1]
    ]
  end

  def display
    row1 = row_starter(" ") + "1 2 3"
    row2 = row_starter("A") + "#{@a1.content}|#{@a2.content}|#{@a3.content}" 
    row3 = row_starter("B") + "#{@b1.content}|#{@b2.content}|#{@b3.content}"
    row4 = row_starter("C") + "#{@c1.content}|#{@c2.content}|#{@c3.content}"

    puts "#{row1}\n#{row2}\n#{row3}\n#{row4}"
  end


  def got_win_case?
    @win_cases.any? do |win_case_array|
      win_case_array.all? { |boardcase| boardcase.content == 'X' } ||
        win_case_array.all? { |boardcase| boardcase.content == 'O' }
    end
  end

  def is_full?
    boardcases.all? { |boardcase| boardcase.content != ' ' }
  end

  private

  def row_starter(first_char)
    first_char.ljust(3, " ")
  end
end
