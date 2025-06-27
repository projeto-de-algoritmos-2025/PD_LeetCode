# @param {String} s1
# @param {Integer} n1
# @param {String} s2
# @param {Integer} n2
# @return {Integer}
def get_max_repetitions(s1, n1, s2, n2)
    return 0 if n1 == 0
  
    index_s2 = 0
    count_s2 = 0
    memo = {}
    i = 0
  
    while i < n1
      s1.each_char do |ch|
        if ch == s2[index_s2]
          index_s2 += 1
          if index_s2 == s2.length
            index_s2 = 0
            count_s2 += 1
          end
        end
      end
  
      i += 1
  
      if memo[index_s2]
        prev_i, prev_count = memo[index_s2]
        cycle_len = i - prev_i
        cycle_count = count_s2 - prev_count
  
        total_cycles = (n1 - i) / cycle_len
        count_s2 += total_cycles * cycle_count
        i += total_cycles * cycle_len
      else
        memo[index_s2] = [i, count_s2]
      end
    end
  
    count_s2 / n2
  end
  