require_relative 'game'

class Main

  def initialize
    @game = Game.new
  end

  def run_game
    Game.new.start_game
  end
  
end
