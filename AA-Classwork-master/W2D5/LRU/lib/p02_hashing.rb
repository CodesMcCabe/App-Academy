require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, i|
      sum += (el.hash + i).hash
    end 
    sum
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    self.chars.map { |ch| alphabet.index(ch.downcase) }.hash
  end
end

class Hashc
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
  
end
