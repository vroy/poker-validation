module Poker
  class Hand < Deck

    Ranks = {
              9 => :royal_flush,
              8 => :straight_flush,
              7 => :four_of_a_kind,
              6 => :full_house,
              5 => :flush,
              4 => :straight,
              3 => :three_of_a_kind,
              2 => :two_pairs,
              1 => :pair,
              0 => :empty,
            }

    def initialize(*cards)
      cards.each { |c| self << c }
    end

    def rank
      Ranks[rank_number]
    end
    
    def rank_number
      Ranks.sort.reverse.each { |rank, symbol| return rank if self.send("#{symbol}?") }
      0
    end
    
    def <=>(other_hand)
      if rank_number < other_hand.rank_number
        return -1
      elsif rank_number > other_hand.rank_number
        return 1
      else
        return 0
      end
    end
    
    def royal_flush?;     self.sort[0].number == 10 && straight_flush?; end
    def straight_flush?;  flush? && straight?;                          end
    def four_of_a_kind?;  pairs(4).size == 1;                           end
    def full_house?;      pairs(3).size == 1 && pairs(2).size == 1;     end
    def flush?;           suits.uniq.size == 1;                         end
    def straight?;        numbers.sequence?;                            end
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
end

