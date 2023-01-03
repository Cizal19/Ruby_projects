require_relative "item.rb"

class List
    CHECKMARK = "\u2713".encode('utf-8')
    attr_accessor :label, :items

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        (0...size).include?(index)
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) && !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts "-------------------------------------------------------------"
        puts @label.upcase.center(53)
        puts "-------------------------------------------------------------"
        puts "#{'Index'.ljust(5)} | #{'Item'.ljust(15)} | #{'Deadline'.ljust(15)} | #{'Done'.ljust(5)}"
        puts "-------------------------------------------------------------"
        @items.each_with_index do |item, i|
            status = item.done ? CHECKMARK : " "
            puts "#{i.to_s.ljust(5)} | #{item.title.ljust(15)} | #{item.deadline.ljust(15)} | [#{status}]"
        end
        puts "-------------------------------------------------------------"

    end

    def print_full_item(index)
        return if !valid_index?(index)
        puts "-------------------------------------------------------------"
        status = items[index].done ? CHECKMARK : " "
        puts "#{@items[index].title.ljust(45)} #{@items[index].deadline.ljust(10)} [#{status}]"
        puts "#{@items[index].description.ljust(25)}"
        puts "-------------------------------------------------------------"
    end
    
    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0
            @items[index] , @items[index - 1] = @items[index - 1] , @items[index]
            index -= 1
            amount -= 1
            break if index == 0
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0
            @items[index] , @items[index + 1] = @items[index + 1] , @items[index]
            index += 1
            amount -= 1
            break if index == @items.index(@items.last)
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.reject! { |item| item.done == true }
    end

end