class Board 
    include Enumerable

    attr_accessor :tab
    
    def initialize
        @tab =  [*0..8].map { |i|  BoardCase.new(i).position }
    end
    
    def display
        puts "                                                                       -------------"
        puts "                                                                       | #{@tab[0]} | #{@tab[1]} | #{@tab[2]} |"
        puts "                                                                       -------------"
        puts "                                                                       | #{@tab[3]} | #{@tab[4]} | #{@tab[5]} |"
        puts "                                                                       -------------"
        puts "                                                                       | #{@tab[6]} | #{@tab[7]} | #{@tab[8]} |"
        puts "                                                                       --------------"
    end

    def case_choice(symbol)
        case_number = gets.chomp.to_i
        @tab = @tab.each_index.map { |i| i == case_number && @tab[i] != "X" && @tab[i] != "O" ? @tab[i] = symbol : @tab[i] }
    end

    def draw?
        puts "Il y a égalité entre les deux joueurs."
    end

    def victory?
        if (@tab[0] == @tab[1] && @tab[0] == @tab[2]) || (@tab[3] == @tab[4] && @tab[3] == @tab[5]) || (@tab[6] == @tab[7] && @tab[6] == @tab[8] ) ||       #TEST LIGNES
           (@tab[0] == @tab[3] && @tab[0] == @tab[6]) || (@tab[1] == @tab[4] && @tab[1] == @tab[7]) || (@tab[2] == @tab[5] && @tab[2] == @tab[8])  ||       #TEST COLONNES
           (@tab[0] == @tab[4] && @tab[0] == @tab[8]) || (@tab[2] == @tab[4] && @tab[2] == @tab[6])                                                         #TEST DIAGONALES
          return true
        else
          return false
        end
    end

end