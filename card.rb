# class for managing a deck of cards
class Card
  attr_reader :card, :shirt, :rating
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SHIRTS = ['♠', '♣', '♦', '♥']

  def initialize(card, shirt)
    @card = card
    @shirt = shirt
  end

  def rating
    return @card if %w[2 3 4 5 6 7 8 9 10].include?(card)
    return 10 if %w[J Q K].include?(card)
    return 1 if card == 'A'
    @rating
  end
  
end
