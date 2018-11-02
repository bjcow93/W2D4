# time complexity of this solution would be O(n^2)
# worst case: O(n^2)
# best/average case: O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, i1|
    arr.each_with_index do |el2, i2|
      next if i1 <= i2
      return true if el1 + el2 == target_sum
    end
  end
  false
end

# time complexity: O(n^2)
# worst case: O(n^2)
# best/average: O(nlogn)
def okay_two_sum?(arr, target_sum)
  arr.sort!           # O(n^2)

  i = 0 # left num of pair
  j = 1

  while i < arr.length - 1
    if arr[i] + arr[j] == target_sum
      return true
    elsif arr[i] + arr[j] > target_sum
      return false
    elsif i + 1 == j
      j += 1
    else
      i += 1
    end
  end
end

def ultimate_two_sum?(arr, target_sum)
  hash = Hash.new(0)

  arr.each do |el|      # O(n)
    hash[el] = 1
  end

end
