require_relative 'board'
require_relative 'player'
require 'pry'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @players = []
  end

  def welcome_message(round)
    puts "Bienvenue dans le Morpion !"
    puts "ROUND #{round} !"
  end

  def initializing_players
    2.times do
      @players.empty? ? initialize_player_number(1) : initialize_player_number(2)
    end
  end

  def player_make_a_move
    current_player.make_a_move(selected_case)
  end

  def end_cases?
    @board.got_win_case? || @board.is_full?
  end

  def switch_turn_to_play
    @players.each do |player|
      player.turn == true ? player.turn = false : player.turn = true
    end
  end

  def results
    if @board.got_win_case?
      current_player.points += 1
      puts "#{current_player.name} a gagné !\n\n"
      display_scores
    else
      puts "Match nul !\n\n"
      display_scores
    end
  end

  def display_scores
    puts "Scores:"
    @players.each { |player| puts "#{player.name} : #{player.points} points" }
  end

  def ending
    puts "\n\nVeux tu relancer une partie ? y/n ?"
    print ">"
    choice = gets.chomp
    exit if choice == "n"
    @board = Board.new
  end

private

  def take_the_other_pawn_shape
    @players.any? { |player| player.pawn_shape == "X" } ? (return "O") : (return "X")
  end

  def initialize_player_number(player_position)
    if player_position == 1
      puts "Joueur 1 quel est ton nom ?"
      name = gets.chomp
      puts 'Avec quels pions veux tu jouer ? "X" ou "O" ?'
      pawn_shape = gets.chomp
      while unvalid_pawn_shape?(pawn_shape)
        puts 'Choisi entre "X" et "O" (en majuscule)'
        pawn_shape = gets.chomp
      end
      p1 = Player.new(name, pawn_shape)
      p1.turn = true
      @players << p1
    elsif player_position == 2
      puts "Joueur 2 quel est ton nom ?"
      name = gets.chomp
      @players << Player.new(name, take_the_other_pawn_shape)
    end
  end

  def unvalid_pawn_shape?(pawn_shape)
    pawn_shape != "X" && pawn_shape != "O"
  end

  def current_player
    @players.find { |player| player.turn == true }
  end

  def selected_case
    puts "C'est au tour de #{current_player.name} de jouer !"
    puts "Choisi une case (ex: A1, B2...)"
    print ">"
    selected_case = boardcase_selection
    until selected_case.is_available?
      puts "cette case est déjà prise, choisi une autre case (ex: A1, B2...)"
      selected_case = boardcase_selection
    end
    return selected_case
  end

  def boardcase_selection
    choice = gets.chomp
    until valid_boardcase_input?(choice)
      puts "Entrée invalide, choisi une case (ex: A1, B2...)"
      choice = gets.chomp
    end
    @board.boardcases.find { |boardcase| boardcase.name == choice }
  end

  def valid_boardcase_input?(input)
     @board.boardcases.any? { |boardcase| boardcase.name == input }
  end

end
