require_relative 'player'
# class for controlling the mechanics of the human player
class Human < Player
  def initialize
    super
  end

  def show_dealer
    @hand.size { |_card| print '*  ' }
  end

end