require "byebug"
class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        puts "Player #{@mark}, enter a 'row col' to place your mark: "
        pos_str = gets.chomp.split(" ")
        pos = pos_str.map { |char| char.to_i }
        pos
    end
end