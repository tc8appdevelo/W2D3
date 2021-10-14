require_relative "board"
require_relative "human_player"
require "byebug"

class Game
    def initialize(player_1_mark, player_2_mark, board)
        @player_1_mark = player_1_mark
        @player_2_mark = player_2_mark
        @current_player = @player_1_mark
        @board = board
    end

    def current_player
        @current_player
    end

    def switch_turn
        #p @current_player
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
        #p @current_player
    end

    def play
        @board.new_board
        while @board.empty_position?
            puts
            @board.print
            puts
            placed = @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts
                puts
                puts "player #{@current_player.mark} won!"
                @board.print
                return "Player #{@current_player.mark} won!"
            end
            switch_turn
        end

        @board.print
        puts
        puts "Draw!"

    end


end


        # load 'human_player.rb'
        # load 'board.rb'
        # load 'game.rb'
        # p1 = HumanPlayer.new("X")
        # p2 = HumanPlayer.new("O")
        # board = Board.new
        # game = Game.new(p1, p2, board)
        # game.play
