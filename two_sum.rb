def bad_two_sum?(arr, target_sum)
    new_arr = arr.permutation(2)

    new_arr.any? {|ele| ele.sum == target_sum}
end


# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum)

    arr.sort.each_with_index do |ele, idx|
        arr.sort.each_with_index do |ele2, idx2|
            if ele + ele2 == target_sum && idx2 > idx
                return true
            end
        end
    end
    return false
end

# arr = [7, 1, 0, 5]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false



def two_sum?(arr, target_sum)
    hash = {} #o(1)
    #7, 6 #=> looking for 1

    arr.each do |ele| #o(n)
        if hash[ele]
            return true
        else
            hash[target_sum - ele] = true
        end
    end
    return false
end

arr = [7, 1, 0, 5]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false