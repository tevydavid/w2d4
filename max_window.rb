require_relative 'stacks_queues'
require 'benchmark'

def windowed_max_range_bad(arr, w)
  total_range_max = 0
  (0..(arr.length - w)).each do |i|
    window = arr[i, w]
    current_range_max = window.max - window.min
    total_range_max = current_range_max if current_range_max > total_range_max
  end
  total_range_max
end

def windowed_max_range(arr, w)
  queue = StackQueue.new
  arr[0, w].each { |el| queue.enqueue(el) }
  total_range_max = queue.max - queue.min
  arr[w..-1].each do |el|
    queue.enqueue(el)
    queue.dequeue
    total_range_max = queue.max - queue.min if queue.max - queue.min > total_range_max
  end
  total_range_max
end



if __FILE__ == $PROGRAM_NAME
 a = (1..50_000).to_a.shuffle

 Benchmark.bm do |x|
   x.report("bad:") {windowed_max_range_bad(a, 5_000)}
   x.report("good:") {windowed_max_range(a, 5_000)}
 end
end
