def windowed_max_range(array, window_size)#n^3
    current_max_range = 0

    (0...array.length).each do |idx|
        if idx + window_size <= array.length
            wind_max = array[idx...(idx + window_size)].max
            wind_min = array[idx...idx+window_size].min
            if (wind_max - wind_min) > current_max_range
                current_max_range = (wind_max - wind_min)
            end
        end
    end

    return current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyQueue

    def initialize
        @inner_array = []
    end

    def enqueue(ele)
        inner_array.unshift(ele)
        self
    end

    def dequeue
        inner_array.pop
    end

    def peek
        @inner_array.last
    end

    def show
        return inner_array.dup
    end

    def empty?
        inner_array.empty?
    end

    private
    attr_reader :inner_array
end

class MyStack
    def initialize
        @store = [] 
    end

    def push(value)
        store << value 
        self 
    end

    def pop
        store.pop 
    end

    def peek
        store.last
    end

    def size
        store.length
    end

    def empty?
        store.empty?
    end
    
    def inspect
        "<#MyStack:#{self.object_id}>" 
    end

    private
    attr_reader
end

class StackQueue < MyQueue
    def initialize
        @inner_array = MyStack.new
    end
end