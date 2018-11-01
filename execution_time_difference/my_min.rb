
# O(n^2)
def my_min_slow(array)
  array.each_with_index do |val1, i1|
    min_value = true
    array.each_with_index do |val2, i2|
      next if i1 == i2
      min_value = false if val2 < val1
    end

    return val1 if min_value
  end
end


# O(n)
def my_min_fast(array)
  min_value = array.first

  array.each do |val|
    min_value = val if val < min_value
  end
  min_value
end
