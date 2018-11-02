# def subsets(arr)
#   return [[]] if arr.empty?
#
#   subs = subsets(arr[0..-2])
#   subs.concat(subs.map{|el| el += [arr.last]})
# end

# O(n^2)
def largest_contiguous_subsum_slow(array)
  result = []

  array.each_with_index do |el1, i1|
    array.each_with_index do |el2, i2|
      result << array[i1..i2] if i1 <= i2
    end
  end

  max = result[0].reduce(:+)

  result.each do |arr|
    max = arr.reduce(:+) if max < arr.reduce(:+)
  end

  max
end

# O(n) time complexity, O(1) space complexity
def largest_contiguous_subsum_fast(array)
  curr_sum = array.first
  largest_sum = array.first

  return array.max if array.all?{|val| val < 0} # O(n)

  array.drop(1).each_with_index do |val, i|
    if val > 0 # add val to curr_sum and largest_sum if it's positive
      curr_sum += val
      largest_sum = curr_sum
    elsif val < 0
      temp_sum = curr_sum + val

      if val + curr_sum > 0
        curr_sum += val
      elsif array[i + 1] + temp_sum < array[i + 1]
        curr_sum = 0
        largest_sum = array[i + 1]
      else
        largest_sum = temp_sum + array[i + 1]
      end
    end

  end
  largest_sum
end

# their O(n) solution
def largest_contiguous_subsum2(array)
  largest_sum = array.first
  curr_sum = array.first

  return array.max if array.all? { |num| num < 0 }

  array.drop(1).each_with_index do |val, i|
    curr_sum = 0 if curr_sum < 0 # resets curr_sum if curr_sum < 0
    curr_sum += val
    largest_sum = curr_sum if curr_sum > largest_sum
  end

  largest_sum
end
