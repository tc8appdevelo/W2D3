require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (@board.size/2)
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships <= 0
            print "you win"
            return true
        end
        false
    end

    def game_over?
        if win? || lose?
            return true
        end
        false
    end

    def turn
        move = @player.get_move
        atk = @board.attack(move)
        if !atk
            @remaining_misses -= 1
        end
        @board.print
        
        print @remaining_misses
        puts


    end

end
