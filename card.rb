module Poker
  class Card
  
    Suits = {
      0 => "C",
      1 => "D",
      2 => "H",
      3 => "S",
    }
    
    Numbers = {
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
    
    # Poker::Card.new(0) # => 2C
    # Poker::Card.new(:number => 2, :suit => 0) # => 2C
    # Poker::Card.new("2C") # => 2C
    def initialize(arg)
      if arg.class == Poker::Card
        @id = arg.id
      
      elsif arg.class == Fixnum
        @id = arg
        
      elsif arg.class == Hash and arg[:number] and arg[:suit]
        @id = ((arg[:number] - 2) * 4) + arg[:suit]
        
      elsif arg.class == String
        num, suit = arg.split("")
        
        @id = Card.new(:number => Numbers.index(num),
                       :suit   => Suits.index(suit.upcase)).id
        
      else
        @id = 0
        
      end
      
      @number = @id / 4 + 2 
      @suit = @id % 4
    end
    
    def <=>(other_card)
      @number <=> other_card.number
    end
    
    def ==(other_card)
      return @id == other_card.id
    end
    
    def to_s
      Numbers[@number][0].chr + Suits[@suit][0].chr
    end
    
    def inspect
      to_s
    end
  end
end


