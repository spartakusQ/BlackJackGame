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
    return @rank if %w[2 3 4 5 6 7 8 9 10].include?(rank)
    return 10 if %w[J Q K].include?(rank)
    return 1 if rank == 'A'
    @value
  end
  
end
