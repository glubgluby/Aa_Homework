class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize

    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    while self.game_over == false
      self.take_turn
    end
    self.game_over_message
    self.reset_game

  end

  def take_turn
    self.show_sequence

    self.require_sequence
    unless self.game_over
      self.round_success_message
      self.sequence_length += 1
    end


  end
 
  def show_sequence
    self.add_random_color
    seq.each do |color|
      puts color
      sleep(0.5)
      system('clear')
    end

  end

  def require_sequence
    puts "input your guesses either as 'red' 'green' 'yellow' 'blue' one at a time"
    guess = []
    i = 0
    until guess.length == seq.length
      input = gets.chomp
      guess << input
      if guess[i] != seq[i]
        game_over = true
        return nil
      end
      system('clear')
    end

  end

  def add_random_color
    seq << COLORS.sample


  end

  def round_success_message
    puts 'Correct'

  end

  def game_over_message
    puts 'puts you lose idiot'

  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

end
