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
  def victory
    p1victory = %w[X X X]
    p2victory = %w[O O O]

    col1victory = @board.each.map { |x| x[0] }
    col2victory = @board.each.map { |x| x[1] }
    col3victory = @board.each.map { |x| x[2] }

    diag_leftright_victory = @board.each.map.with_index { |x, i| x[i] }
    diag_rightleft_victory = @board.each.map.with_index { |x, i| x[2-i] }

    if (@board[0] == p1victory ||
        @board[1] == p1victory ||
        @board[2] == p1victory ||
        col1victory == p1victory ||
        col2victory == p1victory ||
        col3victory == p1victory ||
        diag_leftright_victory == p1victory ||
        diag_rightleft_victory == p1victory)
      system "clear"
      puts "#{@name1} Wins!"
      showboard
      exit
    elsif (@board[0] == p2victory ||
           @board[1] == p2victory ||
           @board[2] == p2victory ||
           col1victory == p2victory ||
           col2victory == p2victory ||
           col3victory == p2victory ||
           diag_leftright_victory == p2victory ||
           diag_rightleft_victory == p2victory)
      system "clear"
      puts "#{@name2} Wins!"
      showboard
      exit
    end
  end

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

    if @board[row][column] != '_'
      puts 'Space is taken, try again!'
      placemarker
    else
      @board[row][column] = currentmarker
    end

    victory
    system "clear"
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
