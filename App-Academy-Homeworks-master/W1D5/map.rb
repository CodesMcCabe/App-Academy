class Map
  
  def initialize
    @map = []
  end
  
  def assign(key, value)
    key_exist = key_idx(key)
    key_exist.nil? ? @map << [key, value] : @map[key_exist][-1] = value
  end
  
  def lookup(key)
    @map.select { |pair| pair.last if pair.first == key }
  end
  
  def remove(key)
    @map.reject! { |pair| pair.first == key }
  end
  
  def show
    @map.dup
  end

  private
  def key_idx(key)
    @map.each_with_index { |pair, idx| return idx if pair.first == key }
    nil
  end
  
end
