class Queue
  
  def initialize
    @queue = []
  end
  
  def enqueue(el)
    @queue.push(el)
  end
  
  def dequeue
    @queue.shift
  end
  
  def show
    @queue.dup
  end
  
end

# queue = Queue.new
# 
# queue.enqueue(5)
# queue.enqueue(15)
# queue.enqueue(20)
# queue.enqueue(25)
# p queue.show
# queue.dequeue
# p queue.show
# queue.dequeue
# p queue.show