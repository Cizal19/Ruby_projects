require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(size,*marks)
        @marks = marks
        @players = @marks.map{|mark| HumanPlayer.new(mark)}
        @board = Board.new(size)
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                puts "------Congratulations, #{@current_player.mark} is the winner------"
                return
            else
                self.switch_turn
            end
        end
        puts "-------Draw-------"
    end
end