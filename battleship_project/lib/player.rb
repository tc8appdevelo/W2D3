class Player
    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        move = []
        m_str = gets.chomp
        m_str.split(" ").each { |char| move << char.to_i }
        move
    end
end
