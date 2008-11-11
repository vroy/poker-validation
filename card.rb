module Poker
  class Card
  
    Suits = {
      0 => "Club",
      1 => "Diamond",
      2 => "Heart",
      3 => "Spades",
    }
    
    Faces = {
      2 => '2',
      3 => '3',
      4 => '4',
      5 => '5',
      6 => '6',
      7 => '7',
      8 => '8',
      9 => '9',
      10 => 'T',
      11 => 'J',
      12 => 'Q',
      13 => 'K',
      14 => 'A',
    }
    
    attr_reader :id, :suit, :number
    
    def initialize(id)
      @id = id
      @number = id / 4 + 2 # used to make cards from 2 to 14
      @suit = id % 4
    end
    
    def <=>(other_card)
      if @number < other_card.number
        return -1
      elsif @number > other_card.number
        return 1
      else
        return 0
      end
    end
    
    def ==(other_card)
      return @id == other_card.id
    end
    
    def to_s
      Faces[@number][0].chr + Suits[@suit][0].chr
    end
    
    def inspect
      to_s
    end
  end
end
