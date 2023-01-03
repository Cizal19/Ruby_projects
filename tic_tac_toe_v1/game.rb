require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(:X)
        @player_2 = HumanPlayer.new(:O)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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