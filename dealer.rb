require_relative 'player'
# class for controlling the mechanics of the dealer
class Dealer < Player
  attr_accessor :hand, :cards, :coin

  def show_dealer
    @hand.size { |_par| print '*  ' }
  end
end
