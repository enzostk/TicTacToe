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
        puts "                  --------------------------------------------------------"
        puts "                  |                                                      |"
        puts "                  |           Bienvenue dans le jeu du Morpion !         |"
        puts "                  |    Le but du jeu est de créer le premier alignment   |"
        puts "                  |            dans un jeu sur grille de 3x3.            |"
        puts "                  |  Le jeu s'arrête si toutes les cases sont remplies.  |"
        puts "                  |                GOOD LUCK HAVE FUN !                  |"
        puts "                  |         Si tu choisis une case occupée,              |"
        puts "                  |                tu perds ton tour !                   |"
        puts "                  |                                                      |"
        puts "                  --------------------------------------------------------"
        puts ""
        # <------------------- Création Player 1 ------------------->
        puts "Quel est le nom du premier joueur? (X)"
        print "> "
        name1 = gets.chomp
        @player1 = Player.new(name1,"X")
        puts ""
        # <------------------- Création Player 2 ------------------->
        puts "Quel est le nom du second joueur? (O)"
        print "> "
        name2 = gets.chomp
        @player2 = Player.new(name2,"O")
        puts ""
        # <-----------------  Création du tableau  ----------------->
        @current_player = @player1
        @tab = Board.new
    end    

#################################################################################################################################################
  def go
    # lance la partie
    while @tab.victory? == false
      self.turn
    end
  end

  # Passe d'un joueur à l'autre
  def switch_players
    if @current_player == @player1
       @current_player = @player2
       #@current_player.name = name2
       #@current_player.symbol = @player2.symbol
    else
       @current_player = @player1
       #@current_player.name = name1
       #@current_player.symbol = @player1.symbol
    end
  end

  #à chaque tour on exécute turn (lancé par la méthode go)
  def turn
    # On boucle tant qu'il n'y a pas de victoire
    loop do
    	     
      puts "=================="
    	puts "Voici l'état du jeu:"
    	# Affiche le plateau :
      @tab.display

      puts ""
      puts "C'est le tour de #{@current_player.name} avec les #{@current_player.symbol}"
      puts "Choisis une case"
      print ">"

      # On appelle la méthode play de la classe board sur le joueur en cours (current). Elle demande au joueur quelle case il joue, puis affiche son symbole dans la case
      @tab.case_choice(@current_player.symbol)

      # On arrête la boucle en cas de victoire
      if @tab.victory? == true
        @tab.display
        puts ""
        puts "#{@current_player.name} a gagné !!!"
        puts
        break
      end

      # Il n'y a pas de victoire : on passe au joueur suivant et on boucle (tour suivant)
      switch_players

    end
  end 

end