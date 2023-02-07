# frozen_string_literal: true

# Class to clear and create an empty board
class Game
  @@marker1 = 'X'
  @@marker2 = 'O'

  def initialize
    @board = { 'top' => %w[_ _ _], 'mid' => %w[_ _ _], 'bot' => %w[_ _ _] }
    p @board['top'].to_s
    p @board['mid'].to_s
    p @board['bot'].to_s
  end

  def self.namereq
    puts 'Player 1, enter your name:'
    @name1 = gets.chomp
    @name1 = @name1.to_s.empty? ? 'Player 1' : @name1
    puts 'Player 2, enter your name:'
    @name2 = gets.chomp
    @name2 = @name2.to_s.empty? ? 'Player 2' : @name2
  end

  # TODO: victory checker... look for victory condition

  # TODO: placemarker method
  def self.placemarker
    p "Player turn #{@turn}"
  end

  # DONE: turn iteration...
  def self.play
    @turn = 1
    i = 0
    while i <= 9
      placemarker
      @turn.zero? ? @turn += 1 : @turn -= 1
      i += 1
      p @turn
    end
  end
end

Game.new
Game.namereq
Game.play
