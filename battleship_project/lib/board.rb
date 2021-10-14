require "byebug"

class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](array)
        row = array[0]
        col = array[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value
    end

    def num_ships
        ships = 0
        @grid.each do |ele_1|
            ele_1.each do |ele|
                if ele == :S
                    ships += 1
                end
            end
        end
        ships
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        end
        self[pos] = :X
        false
    end

    def place_random_ships
        ships = (@size * 0.25).to_i
        i = 0
        while i < ships
            row = rand(@grid.length)
            col = rand(@grid.length)
            pos = [row, col]
            if self[pos] == :S
                next
            else
                self[pos] = :S
                i += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(Math.sqrt(@size)){Array.new(Math.sqrt(@size))}
        
        @grid.each_with_index do |arr, idx_1|
            arr.each_with_index do |ele, idx_2|
                if ele == :S
                    hidden_grid[idx_1][idx_2] = :N
                else
                    hidden_grid[idx_1][idx_2] = ele
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |arr|
            print arr.join(" ")
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end



