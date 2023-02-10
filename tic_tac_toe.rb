# frozen_string_literal: true

# Class to clear and create an empty board
class Game
  @@marker1 = 'X'
  @@marker2 = 'O'

  def initialize
    @board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
    showboard
    namereq
    play
  end

  def showboard
    @board.each_with_index do |_row, row_index|
      @board[row_index].each_with_index do |mark, col_index|
        print mark
        print '|' if col_index < 2
      end
      puts ''
    end
  end

  def namereq
    puts 'Player 1, enter your name:'
    @name1 = gets.chomp
    @name1 = @name1.to_s.empty? ? 'Player 1' : @name1
    puts 'Player 2, enter your name:'
    @name2 = gets.chomp
    @name2 = @name2.to_s.empty? ? 'Player 2' : @name2
  end

  # TODO: victory checker... look for victory condition

  # TODO: placemarker method
  def placemarker
    currentplayer = @turn == 1 ? @name1 : @name2
    currentmarker = @turn == 1 ? @@marker1 : @@marker2
    p "Its your turn, #{currentplayer}!"

    puts "#{currentplayer} which row?"
    row = gets.chomp.to_i
    while row > 3 || row.zero?
      puts "Try again #{currentplayer}, pick a number between 1 and 3"
      row = gets.chomp.to_i
    end
    row -= 1

    puts "#{currentplayer} which column?"
    column = gets.chomp.to_i
    while column > 3 || column.zero?
      puts "Try again #{currentplayer}, pick a number between 1 and 3"
      column = gets.chomp.to_i
    end
    column -= 1

    @board[row][column] = currentmarker

  end

  def play
    @turn = 1
    @i = 1
    while @i <= 9
      if (@i + 1).even?
        puts ''
        puts "ROUND #{(@i + 1) / 2}"
      elsif @i == 1
        puts 'ROUND 1'
      end
      showboard
      placemarker
      @turn == 1 ? @turn += 1 : @turn -= 1
      @i += 1
    end
    puts 'CAT\'S GAME'
  end
end

Game.new
