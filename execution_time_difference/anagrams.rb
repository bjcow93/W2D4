require "byebug"
# O(n!) time complexity
# Increasing the size of the string would increase runtime dramatically very early on.
# comparing silent and listen (6 chars long) would genearte a 720 elt permutation array
def first_anagram?(word1, word2)
  word1_chars = word1.chars

  permutations = word1_chars.permutation(word1_chars.length).to_a

  permutations.each do |perm|
    return true if word2 == perm.join
  end
  false
end

# O(n^2)
# first_anagram? stores all possible permutations of word1.
# second_anagram? iterates through the strings and doesn't generate new strings or arrays,
# only deletes (mutates) word2.
def second_anagram?(word1, word2)
  word1.chars.each_with_index do |char, i1|       # O(n)
    idx2 = word2.index(char)                      # O(n)
    # debugger
    return false if idx2.nil?                     # O(1)
    word2 = word2[0...idx2] + word2[idx2 + 1..-1] # either O(n) or 0(1)
  end
  return false unless word2 == ""                 # O(1)
  true                                            # O(1)
end

# Ruby sort = quicksort
# Best/Average Case: O(nlogn)
# Worst Case: O(n^2)

# == is O(n), so final time complexity is O(n^2 + n^2 + n) = O(n^2)
def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end


# time complexity is O(n)
# space complexity is O(1) w/ only 26 different letters
def fourth_anagram?(word1, word2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  word1.each_char do |char|
    hash1[char] += 1
  end

  word2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end
