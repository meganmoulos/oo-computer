require 'pry'

class Computer
    attr_reader :brand, :model
    attr_accessor :memory_GB, :storage_free

    # your code here
    def initialize (brand, model)
        @brand = brand
        @model = model
        @memory_GB = 8
        @storage_free = 1000
    end
    
    def memory_GB=(value)
        @memory_GB = value
    end

    def storage_free=(value)
        @storage_free = if value > 1000
            1000
        elsif value < 0
            0
        else
            value
        end
    end

    def upgrade_memory(hash)
        self.memory_GB += hash[:size]
    end

    def disk_full? (file_size)
        if self.storage_free < file_size
            true
        else
            false
        end
    end

    def save_file (file)
        if disk_full?(file[:size])
            "There is not enough space on disk to save #{file[:name]}."
        else
            self.storage_free - file[:size]
        end
    end

    def delete_file(file)
        self.storage_free += file[:size]
        "The #{file[:name]} has been deleted"
    end

    def specs 
        "Current memory: #{self.memory_GB}, Free Storage: #{self.storage_free}"
    end

end

# you can write code here to test your solution
# create an instance of Computer
# call methods on it

dell = Computer.new("dell", "laptop")

binding.pry
0