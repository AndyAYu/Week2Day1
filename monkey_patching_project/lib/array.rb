# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end
  
    def middle(sorted)
        mid_index = 0
        if sorted.length.odd?
            mid_index = sorted[(sorted.length-1) / 2]
        else
            mid_index = (sorted[(sorted.length/2)] + sorted[(sorted.length / 2 - 1)] ) / 2.0
        end
        return mid_index
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        return middle(sorted)
    end

    def counts
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1 
        end
        hash
    end

    def my_count(el)
        count = 0
        self.each do |ele|
            if ele == el
                count += 1 
            end
        end
        count
    end
    
    def my_index(el)
        return nil if !self.include?(el)
        arr = []
        self.each_with_index do |ele, idx|
            if ele == el
                arr << idx 
            end
        end     
        arr.first
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele) 
                new_arr << ele
            end
        end
        new_arr
    end

   def my_transpose
    new_arr = Array.new(self[0].length) { Array.new(self.length) }

        self.each_with_index do |sub, idx1|
            sub.each_with_index do |ele, idx2|
                new_arr[idx2][idx1] = ele
            end
        end
    new_arr
   end

end
