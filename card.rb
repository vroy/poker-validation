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
    
    # Poker::Card.new(0) # => 2C
    # Poker::Card.new(:number => 2, :suit => 0) # => 2C
    # Poker::Card.new("2C") # => 2C
    def initialize(arg)
      if arg.class == Fixnum
        @id = args.first
        
      elsif arg.class == Hash and arg[:number] and arg[:suit]
        @id = ((arg[:number] - 2) * 4) + arg[:suit]
        
      elsif arg.class == String
        face, suit_str = arg.split("")
        
        number = Faces.select { |k, v| v == face }.first.first
        suit = Suits.select { |k, v| v[0].chr.downcase == suit_str.downcase }.first.first
        
        @id = Card.new(:number => number, :suit => suit).id
        
      else
        @id = 0
        
      end
      
      @number = @id / 4 + 2 
      @suit = @id % 4
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


