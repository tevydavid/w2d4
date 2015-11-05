def bad_two_sum?(arr, sum)
    (0...arr.length).each do |i|
      (i+1...arr.length).each do |j|
        return true if arr[i] + arr[j] == sum
      end
    end
  false
end
###bad two sum has O(n^2) time complexity.
def okay_two_sum?(arr, sum)
  sorted = arr.dup.sort
  arr.each do |el|
    return false if el > sum
    return true if arr.b_search(sum - el)
  end
  false
end

class Array
  def b_search(target)
    return nil if length == 0
    middle = length / 2
    case target <=> self[middle]
    when -1
      self[0...middle].b_search(target)
    when 0
      middle
    when 1
      probe = self[(middle + 1)..-1].b_search(target)
      probe.nil? ? nil : (middle + 1) + probe
    end
  end
end

def pair_sum?(arr, sum)
  complements = Hash.new(0)
  arr.each do |el|
    k = sum - el
    return true if complements.has_key?(k)
    complements[el] = k
  end
  false
end




def four_sum?(arr, sum)
  complements = Hash.new(0)
  arr.each do |el|
    k = sum - el
    return true if complements.has_key?(k)
    complements[el] = k
  end
  arr.each do |el|
    complements[el] = sum - complements[el] el
  end
end
