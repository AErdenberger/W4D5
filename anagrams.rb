#Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
#Check if the second string is one of these.

def first_anagram?(word_1, word_2) # 3n!
    word_1_arr = word_1.split("")
    word_2_arr = word_2.split("")
    word_1_arr.permutation(word_1.length).include?(word_2_arr) #arr.permutation = n!
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

#Write a method #second_anagram? that iterates over the first string.
#For each letter in the first string, find the index of that letter in the second string 
#(hint: use Array#find_index) and delete at that index. 
#The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

def second_anagram?(word_1, word_2)#n^2
    #return false if word_1.length != word_2.length #2n

    word_1_arr = word_1.split("")
    word_2_arr = word_2.split("")

    (0...word_1_arr.length).each do |idx|
        if word_2_arr.include?(word_1_arr[idx])
            idx_2 = word_2_arr.find_index(word_1_arr[idx])
            word_2_arr = word_2_arr[0...idx_2] + word_2_arr[(idx_2 + 1)..-1]
        else
            return false
        end
    end

    return word_2_arr.empty? #n
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

#Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
#The strings are then anagrams if and only if the sorted versions are identical.

def third_anagram?(word_1, word_2)#n^4
    word_1_arr = word_1.split("").sort
    word_2_arr = word_2.split("").sort

    word_1_arr == word_2_arr
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

#Write one more method #fourth_anagram?. This time, use two hashes to store the number of times each letter appears in both words. 
#Compare the resulting hashes.

def fourth_anagram?(word_1, word_2) #3n
    ana_hash(word_1) == ana_hash(word_2)
end

def ana_hash(word) #n
    hash = Hash.new(0)

    word.each_char do |char|
        hash[char] += 1
    end

    return hash
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def fifth_anagram?(word_1, word_2)
    hash = Hash.new(0)

    word_1.each_char do |char|
        hash[char] += 1
    end

    word_2.each_char do |char|
        hash[char] -= 1
        if hash[char] < 0
            return false
        end
    end

    return true
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true