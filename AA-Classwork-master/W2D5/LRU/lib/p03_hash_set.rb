require_relative 'p02_hashing'

class HashSet
#   attr_reader :count
# 
#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
# 
#   def insert(key)
#   end
# 
#   def include?(key)
#   end
# 
#   def remove(key)
#   end
# 
#   private
# 
#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end
# 
#   def num_buckets
#     @store.length
#   end
# 
#   def resize!
#   end
# end
attr_accessor :count

def initialize(num_buckets = 8)
  # @num_buckets = num_buckets
  @store = Array.new(num_buckets) { Array.new }
  @count = 0
end

def insert(num)
  num = num.hash
  # debugger
  if !self[num].include?(num)
    self[num] << num 
    @count += 1
  end
  
  resize! if @count == num_buckets
end

def remove(num)
  num = num.hash
  self[num].delete(num)
end

def include?(num)
  num = num.hash
  self[num].include?(num)
end

private

def [](num)
  # optional but useful; return the bucket corresponding to `num`
  @store[num % num_buckets]
end

def num_buckets
  @store.length
end

def resize!
  duped_store = @store.dup
  
  @store = Array.new(num_buckets * 2) { Array.new }
  self.count = 0
  
  duped_store.each do |el|
    # debugger
    if !el.empty?
      el.each do |num|
        self.insert(num)
      end
    end
        
  end
end

end
