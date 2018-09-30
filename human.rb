require_relative 'player'
# class for controlling the mechanics of the human player
class Human < Player
  def initialize(name)
    @name = name
    @coin = 100
    @cards = Deck.new
    @hand = []
  end

  def show_dealer
    @hand.size { |_card| print '*  ' }
  end

end