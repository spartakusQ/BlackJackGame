require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'gambler'
require_relative 'player'
# class to manage the game
class Game
  attr_accessor :cards, :deck, :hand, :player, :coin

  def initialize
    @deck = Deck.new
    @human = Gambler.new(@name)
    @dealer = Dealer.new('Dealer')
  end

  def start_round
    2.times { @human.deal }
    2.times { @dealer.deal }
    @human.rate
    @dealer.rate
    # first_distribution
  end

  def player_hand
    @human.show_gambler
  end

  def see_dealer
     @dealer.show_dealer
  end

  def human_scores
    @human.scorer_values
  end

  def dealer_scores
    @dealer.scorer_values
  end

  def see_human
    @human.show_card
  end





  



  def first_distribution
    @player_hand = []
    @player_hand << @human.hand[0].par + @human.hand[0].shirt + ' ' + @human.hand[1].par + @human.hand[1].shirt
    # @player_hand.each {|x| puts x }
    # puts "#{@name} у вас на руках карты #{@human.hand[0].par} #{@human.hand[0].shirt} #{@human.hand[1].par}#{@human.hand[1].shirt}
    @player_bank = []
    @player_bank << @human.coin
    @player_bank.each {|x| puts x }
    # у вас осталось #{@human.coin}$ сумма карт #{card_amount(@human)} "
    # puts "#{see_dealer} #{@dealer.coin}$"
  end


  def player_amount
    @player_amount = []
    @player_amount << card_amount(@human)
    # @player_amount.each {|x| puts x }
  end

end
