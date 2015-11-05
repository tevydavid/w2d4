def my_min(arr)
  arr.each do |el|
    smallest = true
    arr.each do |el2|
      smallest = false if el > el2
    end
    return el if smallest
  end
end

def my_min2(arr)
  smallest = arr.first
  arr.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

def largest_sub_sum(arr)
  sub_arrays = []
  arr.each_index do |i|
    (i...arr.length).each do |j|
      sub_arrays << arr[i..j]
    end
  end
  sub_arrays.map { |el| el.inject(:+) }.max
end


def largest_sub_sum_linear(arr)
  tally = 0
  sum = 0
  i = 0
  while i < arr.size
    tally += arr[i]
    sum = tally if tally > sum
    tally = 0 if tally < 0
    i += 1
  end
  sum
end
