require 'byebug'
class Board
  attr_accessor :cups, :players

  def initialize(name1, name2)
    @players = [name1, name2]
    @cups = Array.new(14){Array.new(4, :stone)}
    @cups[6], @cups[13] = [], []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 14
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def opps_cup?(player,n)
    y = [13,6]
    players.index(player) != y.index(n)
  end
  def my_cup(p,n)
    y = [6,13]
    players.index(p) != y.index(n)
  end

  def make_move(start_pos, current_player_name)
    #debugger
    y = self.cups[start_pos]
    x = self.cups[start_pos].size
    z = start_pos + 1
    while x > 0
      if z > 13
        z = 0
      end
      unless !opps_cup?(current_player_name, z)
        self.cups[z] += [y.pop]
        x -= 1
      end
      z += 1
    end
    render
    next_turn(z, current_player_name)
  end

  def next_turn(ending_cup_idx, p)
    #debugger
    if my_cup(ending_cup_idx, p)
      return :prompt
    elsif cups[ending_cup_idx].size == 0
      return :switch
    else
      return ending_cup_idx - 1
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?{|x|x == []} || cups[7..12].all?{|x| x==[]}
  end

  def winner
    if cups[6].size == 6 && cups[13].size == 6
      return :draw
    elsif cups[6].size == 6
      return players[0]
    elsif cups[13].size == 6
      return players[1]
    end
  end
end
