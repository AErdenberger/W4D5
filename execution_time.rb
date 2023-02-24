def my_min(list) # n^2
    list.each do |ele|
        list.all? do |ele2|
            return ele if ele2 > ele
        end
    end
end


def my_min(list) #n
    list.inject do |acc, ele|
        if acc < ele
            acc
        else
            ele
        end
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


# def largest_contiguous_subsum(list) #n^4
#     arr = []
#     (0...list.length).each do |i|
#         (0...list.length).each do |j|
#             arr << list[i..j] if i < j
#         end
#     end

#     new_arr = arr.map do |ele|
#         ele.sum
#     end

#     new_arr.max
# end

def largest_contiguous_subsum(list)
    largest_sum = 0 #=> 1 memory
    current_sum = 0 #=> 1 memory
    list.each do |ele|
        if ele > 0
            current_sum += ele # 7 + 14
        else
            if current_sum > largest_sum
                largest_sum = current_sum
            end
            current_sum = 0
        end
    end
    return largest_sum if largest_sum > current_sum
    return current_sum
end

list = [-1, 5, 3, -7, 8, 10, -10, 7, 14]
# list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 18

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7

