require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    
    # @name1 = name1
    # @name2 = name2
    @cups = Array.new(14) { Array.new([]) }
    @cups.each_with_index do |cup_arr, idx| # figure out why this gave me issues
      if idx != 6 && idx != 13
        4.times { cup_arr << :stone } 
      end
    end
  end


  def place_stones # should use this 
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > @cups.length
      raise "Invalid starting cup"
    end
  end



  def make_move(start_pos, current_player_name)
    # debugger
    start = @cups[start_pos]
  
    new_pos = start_pos
    until @cups[start_pos].empty? # why did this give me issues?
      new_pos += 1
      new_pos = 0 if new_pos > 13
      if new_pos == 13 # if there are absolutes, then make sure we account for them explicitly
        @cups[13] << @cups[start_pos].pop  if current_player_name == @player2 
      elsif new_pos == 6
        @cups[6] << @cups[start_pos].pop  if current_player_name == @player1
      else
        @cups[new_pos] << @cups[start_pos].pop
      end
    end
    self.render
  
    next_turn(new_pos) 
  end
  
  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
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
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      :draw
    when - 1
      @player2
    when 1
      @player1
    end
  end
end
