class Item
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)
        arr = date_string.split("-")
        year, month, day = arr
        return false if (arr.length != 3) || (year.length != 4) || (month.length != 2) || (day.length != 2)
        return false if !(1..12).include?(month.to_i) || !(1..31).include?(day.to_i)
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid date"
        end
        @description = description
    end

end


