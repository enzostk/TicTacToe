require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/app/board' 
require_relative 'lib/app/player' 
require_relative 'lib/app/boardcase' 
require_relative 'lib/app/game' 

class Application
      Game.new.go
end