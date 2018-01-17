class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

# arr = Stack.new
# arr.add(5)
# arr.add(7)
# arr.add(10)
# p arr.show
# arr.remove
# arr.remove
# p arr.show
# arr.add(15)
# # arr.remove
# p arr.show