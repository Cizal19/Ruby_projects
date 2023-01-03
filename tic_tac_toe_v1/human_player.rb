class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player #{@mark} enter two numbers representing a position in the format `row col`"
        pos_str = gets.chomp
        pos_arr = pos_str.split
        if pos_arr.length != 2
            raise "sorry, that was invalid :("
        end
        pos = pos_arr.map { |ele| ele.to_i }
        pos
    end

end