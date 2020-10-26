require_relative 'game'
require_relative 'show'

class Application

  def initialize
    @show = Show.new
  end

  def perform
    round = 1
    my_game = Game.new
    loop do
      my_game.welcome_message(round)
      my_game.initializing_players if round == 1
      loop do
        @show.show_board(my_game.board, round)
        my_game.player_make_a_move
        break if my_game.end_cases?
        my_game.switch_turn_to_play
      end
      @show.show_board(my_game.board, round)
      my_game.results
      my_game.ending
      round += 1
    end
  end

end
