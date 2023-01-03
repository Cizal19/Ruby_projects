class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        legal = false
        until legal
            puts "Player #{@mark} enter two numbers representing a position in the format `row col`"
            pos_str = gets.chomp
            pos_arr = pos_str.split
            pos = pos_arr.map { |ele| ele.to_i }
            if pos_arr.length != 2
                puts "invalid position"
            elsif legal_positions.include?(pos)
                legal = true
            else 
                puts "#{pos} is not a valid postion"
            end
        end
        pos
    end

end