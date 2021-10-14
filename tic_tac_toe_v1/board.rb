require "byebug"
class Board
    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
        
    end

    def grid
        @grid
    end

    def new_board
        @grid = Array.new(3){Array.new(3, "_")}
        @grid
    end

    # tell if the position is within the board
    def valid?(pos)
        if pos.length != 2
            return false
        end
        row = pos[0]
        col = pos[1]

        if row.to_i != row || col.to_i != col
            return false
        end

        if row < 0 || col < 0
            return false
        end

        if row < @grid.length
            if col < @grid[row].length
                return true
            end
        end
        false 
    end

    # tell whether or not a players mark is there
    def empty?(pos)
        if valid?(pos)
            row = pos[0]
            col = pos[1]
            if @grid[row][col] == "_"
                return true
            end
        end
        false
    end


    # this should assign X or O, the players mark
    # to the position use valid? and empty? first
    def place_mark(pos, mark)
        if !valid?(pos)
            #puts "Enter two numbers between 0 and #{@grid.length-1}."
            puts "invalid positon"
            return false
        end

        if empty?(pos)
            row = pos[0]
            col = pos[1]
            @grid[row][col] = mark
            return true
        else
            puts "Position taken by #{@grid[pos[0]][pos[1]]}"
            return false
        end
    end

    def print
        # print what round or which players turn it is later
        puts "-------------"
        @grid.each do |row|
            puts "    " + row.join(" ")
        end
        puts
        puts "-------------"
    end

    def win_row?(mark, grid = @grid)
        
        #cnt = 1
        grid.each do |row|
            cnt = 1
            row.each_with_index do |ele, idx|
                
                if ele == mark
                    if ele == row[idx + 1]
                        cnt += 1
                        if cnt >= 3
                            return true
                        end
                    else
                        cnt = 1
                    end
                end
            end
        end
        false
    end

    def win_column?(mark)
        flip = Array.new(@grid.length){Array.new(@grid.length, "_")}
        #p flip
        @grid.each_with_index do |row, row_idx|
            #debugger
            row.each_with_index do |space, col_idx|
                
                flip[col_idx][row_idx] = space
            end
        end
        #p flip
        win_row?(mark, flip)
    end

    def win_diagonal?(mark)
        # test if it scales up
        dia_1 = []
        dia_2 = []
        i = 0
        j = @grid.length - 1
        # could change this to be -i for dia_2
        # I think
        while i < @grid.length
            dia_1 << @grid[i][i]
            dia_2 << @grid[i][j - i]
            i += 1
        end
        dia_grid = [dia_1, dia_2]
        win_row?(mark, dia_grid)
    end

    def win?(mark)
        
        if win_row?(mark)
            return true
        elsif win_column?(mark)
            return true
        elsif win_diagonal?(mark)
            return true
        end

        false
        
    end

    def empty_position?
        @grid.each do |row|
            row.each do |ele|
                if ele == "_"
                    return true
                end
            end
        end
        false
    end

end