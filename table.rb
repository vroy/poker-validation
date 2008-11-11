module Poker
  class Table
    
    attr_accessor :deck, :hands
    
    def initialize(size)
      @deck = Deck.new
      @hands = @deck.deal(size)
    end
    
    def winner
      @hands.sort.last
    end
  end
end
