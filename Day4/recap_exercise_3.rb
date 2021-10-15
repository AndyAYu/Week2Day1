def no_dupes?(array)
    array.select { |ele| array.count(ele) == 1 } 
end


# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(array)

    (0...array.length-1).each do |idx|
        if array[idx] == array[idx + 1]
            return false
        end
    end
    true
end
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    # hash = Hash.new { Array.new([])}
    hash = Hash.new { |h,k| hash[k] = [] }
    str.each_char.with_index do |char,idx|
        hash[char] << idx
    end
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1
    end
    sorted = hash.sort_by { |k, v| v }
    sorted[-1][0] * sorted[-1][1]
end
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

def bi_prime?(num)

    (2...num).each do |n|
        if num % n == 0 && prime?(n) && prime?(num / n)
            return true
        end
    end
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    new_str = ""
    alpha = [*"a".."z"]
    message.each_char do |char|
        keys_idx = new_str.length % keys.length
        old_idx = alpha.index(char)
        new_idx = (old_idx + keys[keys_idx]) % 26
        new_char = alpha[new_idx]
        new_str += new_char
    end
    new_str
end



# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = 'aeiou'
    vow_arr = []
    new_str = ""
    str.each_char.with_index do |char,idx|
        if vowels.include?(char)
            vow_arr << char
        end
    end
    first = vow_arr.shift
    last = vow_arr.pop
    vow_arr.unshift(last)

    (1...vow_arr.length-1).each do |char|
        

    vow_arr.push(first)

    
end

vowel_rotate('computer')      # => "cempotur"
vowel_rotate('oranges')       # => "erongas"
vowel_rotate('headphones')    # => "heedphanos"
vowel_rotate('bootcamp')      # => "baotcomp"
vowel_rotate('awesome')       # => "ewasemo"