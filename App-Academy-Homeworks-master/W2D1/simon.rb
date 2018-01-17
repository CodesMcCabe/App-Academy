class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @rounds_won = 0
  end

  def play
    system('clear')
    intro_message

    until game_over
      take_turn
    end
    game_over_message
    reset_game
    puts "\n Press enter to reset game"
    gets.chomp
    play
  end

  def take_turn
    system('clear')
    show_sequence
    require_sequence

    if @game_over == false
      round_success_message
      @sequence_length += 1
      sleep(2)
    end
  end

  def intro_message
    puts 'Welcome to Simon!'
    puts 'A sequnce of colors will show on the screen. Repeat them back.'
    puts 'If you type an incorrect sequence, the game is over.'
    puts "\nPress enter when ready."
    gets.chomp
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system('clear')
      sleep(0.5)
    end
  end

  def require_sequence
    @seq.each do |color|
      puts "Enter a color: "
      user_color = gets.chomp
      if user_color != color
        @game_over = true
        break
      end
      system('clear')
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You won the round!"
    rounds_won_message
  end

  def game_over_message
    system('clear')
    puts "Game over!"
    rounds_won_message
  end

  def rounds_won_message
    puts "Rounds won: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

end

# if $PROGRAM == __FILE__
  simon = Simon.new
  simon.play
# end
