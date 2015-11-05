def first_anagram?(word1,word2)
  possible_anagrams = word1.chars.permutation(word1.size).to_a
  possible_anagrams.include?(word2.chars)
end

def second_anagram?(word1,word2)
  word_1 = word1.dup
  word_2 = word2.dup
  word1.each_char do |char|
    if word2.include?(char)
      word_1 = word_1.sub(char,"")
      word_2 = word_2.sub(char,"")
    end
  end
  word_1.empty? && word_2.empty?
end

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  word_1 = Hash.new(0)
  word_2 = Hash.new(0)

  word1.each_char do |char|
    word_1[char] += 1
  end

  word2.each_char do |char2|
    word_2[char2] += 1
  end

  word_1 == word_2
end

def fifth_anagram?(word1, word2)
  letter_counts = Hash.new(0)
  word1.each_char do |char|
    letter_counts[char] += 1
  end

  word2.each_char do |char2|
    letter_counts[char2] -= 1
  end

  letter_counts.values.all? { |v| v == 0 } 
end
