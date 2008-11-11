class Hand < Deck

  Ranks = [:royal_flush, :straight_flush,  :four_of_a_kind, :full_house, :flush,
           :straight,    :three_of_a_kind, :two_pairs,      :pair,       :empty]
  
  def initialize(*cards)
    cards.each { |c| self << c }
  end
  
  def rank
    Ranks.each { |rank| return rank if self.send("#{rank}?") }
    :empty
  end
  
  def royal_flush?;     self.sort[0].number == 10 && straight_flush?; end
  def straight_flush?;  flush? && straight?;                          end
  def four_of_a_kind?;  pairs(4).size == 1;                           end
  def full_house?;      pairs(3).size == 1 && pairs(2).size == 1;     end
  def flush?;           suits.uniq.size == 1;                         end
  def straight?;        numbers.following;                            end
  def pair?;            pairs(2).size == 1; end
  def two_pairs?;       pairs(2).size == 2; end
  def three_of_a_kind?; pairs(3).size == 1; end
  
  private
  def pairs(pair_size)
    pairs = []
    
    numbers.map do |number|
      next if pairs.include?(number)
      
      if numbers.select { |x| x == number }.size == pair_size
        pairs << number
      end
    end
    
    pairs
  end
end
