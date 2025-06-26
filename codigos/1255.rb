# @param {String[]} words
# @param {Character[]} letters
# @param {Integer[]} score
# @return {Integer}
def max_score_words(words, letters, score)
    letter_count = Hash.new(0)
    letters.each { |ch| letter_count[ch] += 1 }
  
    word_scores = []
    word_letter_counts = []
  
    words.each do |word|
      count = Hash.new(0)
      word.each_char { |ch| count[ch] += 1 }
      word_letter_counts << count
  
      total_score = word.chars.sum { |ch| score[ch.ord - 'a'.ord] }
      word_scores << total_score
    end
  
    def backtrack(i, words, word_letter_counts, word_scores, available)
      return 0 if i == words.length
  
      max_score = backtrack(i + 1, words, word_letter_counts, word_scores, available)
  
      can_use = true
      word_letter_counts[i].each do |ch, cnt|
        if available[ch] < cnt
          can_use = false
          break
        end
      end
  
      if can_use
        word_letter_counts[i].each { |ch, cnt| available[ch] -= cnt }
        score_with_word = word_scores[i] + backtrack(i + 1, words, word_letter_counts, word_scores, available)
        max_score = [max_score, score_with_word].max
        word_letter_counts[i].each { |ch, cnt| available[ch] += cnt }
      end
  
      max_score
    end
  
    backtrack(0, words, word_letter_counts, word_scores, letter_count)
  end
  