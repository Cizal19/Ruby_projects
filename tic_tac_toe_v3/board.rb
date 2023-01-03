class Board
    def initialize(size)
        @size = size
        @grid = Array.new(@size) { Array.new(@size) { "_" } }
    end

    def valid?(position)
        row, col = position
        return false if !(0...@size).include?(row) || !(0...@size).include?(col)
        true
    end

    def empty?(position)
        row, col = position
        if @grid[row][col] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        row, col = position
        if valid?(position) && empty?(position)
            @grid[row][col] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        @grid.each do |r|  # r = row
            puts r.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |r|
            return true if r.all? { |ele| ele == mark }
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |c| # c = column
            return true if c.all? { |ele| ele == mark }
        end
        false
    end

    def win_diagonal?(mark)
        diagonal_1 = []
        diagonal_2 = []

        for row in 0...@size do
            for col in 0...@size do
                diagonal_1 << @grid[row][col] if row == col
            end
        end

        col = @size - 1
        row = 0 
        while row < @size
            while col >= 0
                diagonal_2 << @grid[row][col]
                col -= 1
                row += 1
            end
        end

        return true if diagonal_1.all? { |ele| ele == mark }
        return true if diagonal_2.all? { |ele| ele == mark }

        false
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        @grid.each do |r|
            return true if r.any? { |ele| ele == "_" }
        end
        false
    end

    def legal_positions
        legals = []
        (0...@size).each do |row|
            (0...@size).each do |col|
                if @grid[row][col] == "_"
                    legals << [row, col]
                end
            end
        end
        legals
    end

end