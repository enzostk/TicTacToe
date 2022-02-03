require 'bundler'
Bundler.require
require 'pry'

require_relative 'board' 
#require_relative 'lib/app/player' 
#require_relative 'lib/app/boardcase' 

#################################################################################################################################################
#################################################################################################################################################

class Game 
    
    def initialize
        system "clear"
        puts "                                                   --------------------------------------------------------"
        puts "                                                   |                                                      |"
        puts "                                                   |                                                      |"
        puts "                                                   |           Bienvenue dans le jeu du Morpion !         |"
        puts "                                                   |    Le but du jeu est de créer le premier alignment   |"
        puts "                                                   |            dans un jeu sur grille de 3x3.            |"
        puts "                                                   |  Le jeu s'arrête si toutes les cases sont remplies.  |"
        puts "                                                   |  Choisir une case occupée te fait perdre ton tour.   |"
        puts "                                                   |                                                      |"
        puts "                                                   |                                                      |"
        puts "                                                   |                       \\\\\||||||///                    |"
        puts "                                                   |                        \\  ~ ~  /                     |"
        puts "                                                   |                        (  @ @  )                     |"
        puts "                                                   |               ______ oOOo-(_)-oOOo___________        |"
        puts "                                                   |               .......                                |"            
        puts "                                                   |               .......  GOOD LUCK HAVE FUN !          |"        
        puts "                                                   |               .......                                |"                  
        puts "                                                   |               _____________Oooo._____________        |"                    
        puts "                                                   |                 .oooO     (   )                      |"              
        puts "                                                   |                  (   )     )  /                      |"            
        puts "                                                   |                   l  (     (_/                       |"                      
        puts "                                                   |                    l _)                              |"            
        puts "                                                   |                                                      |"
        puts "                                                   |                                                      |"
        puts "                                                   --------------------------------------------------------"
        puts ""
        # <------------------- Création Player 1 ------------------->
        puts "                                                   Quel est le nom du premier joueur? (Qui jouera avec les X)"
        print "                                                                    >  "
        name1 = gets.chomp
        @player1 = Player.new(name1,"X")
        puts ""
        # <------------------- Création Player 2 ------------------->
        puts "                                                   Quel est le nom du second joueur? (Qui jouera avec les O)"
        print "                                                                   >  "
        name2 = gets.chomp
        @player2 = Player.new(name2,"O")
        puts ""
        # <-----------------  Création du tableau  ----------------->
        @current_player = @player1
        @tab = Board.new
    end    

#################################################################################################################################################

  def go # Lancement de la partie 
    while @tab.victory? == false
      self.turn
    end
  end

  # Passe d'un joueur à l'autre
  def switch_players
    if @current_player == @player1
       @current_player = @player2
    else
       @current_player = @player1
    end
  end

#################################################################################################################################################

  def turn
      10.times do |i|  # Boucle tant qu'il n'y a pas de victoire ou d'égalité   
        puts "                                                          =========================================="
        puts "                                                          |     Voici l'état du plateau de jeu     |"
        puts "                                                          =========================================="
        puts ""
        # Affichage du plateau :
        puts "#{@tab.display}"

        puts ""
        puts "                                                          C'est le tour de #{@current_player.name} avec les #{@current_player.symbol}"
        puts "                                                          Choisis une case"
        print "                                                         >  "

        # On appelle la méthode play de la classe board sur le joueur en cours (current). Elle demande au joueur quelle case il joue, puis affiche son symbole dans la case
        @tab.case_choice(@current_player.symbol)
        puts ""
        # Arrêt de la boucle pour .victory?
          if @tab.victory? == true
            @tab.display
            puts ""
            puts "                                                        #{@current_player.name} a gagné !!!"
            puts
            break
          end
        switch_players
        # Il n'y a pas de victoire : on passe au joueur suivant et on boucle (tour suivant)  
      end
  end 

  def regame
    puts "Voulez-vous relancer une partie?"
  end
end

#################################################################################################################################################
#################################################################################################################################################