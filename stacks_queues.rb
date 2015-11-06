class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[:val]
  end

  def push(el)
    if @store.empty?
      @store << {val: el, max: el, min: el}
    else
      @store << {val: el,
      max: (el > self.max ? el : self.max),
      min: (el < self.min ? el : self.min)
    }
    end
  end

  def max
    return nil if @store.empty?
    self.peek[:max]
  end

  def min
    return nil if @store.empty?
    self.peek[:min]
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    if @out_stack.empty?
      until @in_stack.empty?
        item = @in_stack.pop
        @out_stack.push(item)
      end
    end
    @out_stack.pop
  end

  def peek
    if @out_stack.empty?
      until @in_stack.empty?
        item = @in_stack.pop
        @out_stack.push(item)
      end
    end
    @out_stack.peek
  end

  def max
    if @in_stack.empty? && @out_stack.empty?
      nil
    elsif @in_stack.empty?
      @out_stack.max
    elsif @out_stack.empty?
      @in_stack.max
    else
      @in_stack.max > @out_stack.max ? @in_stack.max : @out_stack.max
    end
  end

  def min
    if @in_stack.empty? && @out_stack.empty?
      nil
    elsif @in_stack.empty?
      @out_stack.min
    elsif @out_stack.empty?
      @in_stack.min
    else
      @in_stack.min < @out_stack.min ? @in_stack.min : @out_stack.min
    end 
  end

  def size
    @out_stack.size + @in_stack.size
  end

  def empty?
    @out_stack.empty? && @in_stack.empty?
  end
end
