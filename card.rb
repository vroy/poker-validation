class Card
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
  
  def to_s
    "c#{@id.to_s}, number: #{@number}, suit: #{@suit}"
  end
  
  def inspect
    "c#{@id.to_s}"
  end
end
