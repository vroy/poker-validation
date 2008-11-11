SortedDeck = Deck.new.sort

TestHands = {
  :royal_flush     => Hand.new(SortedDeck[32], SortedDeck[36], SortedDeck[40], SortedDeck[44], SortedDeck[48]),
  :straight_flush  => Hand.new(SortedDeck[28], SortedDeck[32], SortedDeck[36], SortedDeck[40], SortedDeck[44]),
  :four_of_a_kind  => Hand.new(SortedDeck[32], SortedDeck[33], SortedDeck[34], SortedDeck[35], SortedDeck[48]),
  :full_house      => Hand.new(SortedDeck[32], SortedDeck[33], SortedDeck[34], SortedDeck[36], SortedDeck[37]),
  :flush           => Hand.new(SortedDeck[0],  SortedDeck[8],  SortedDeck[48], SortedDeck[24], SortedDeck[32]),
  :straight        => Hand.new(SortedDeck[15], SortedDeck[5],  SortedDeck[18], SortedDeck[0],  SortedDeck[11]),
  :three_of_a_kind => Hand.new(SortedDeck[0],  SortedDeck[2],  SortedDeck[3],  SortedDeck[10], SortedDeck[7]),
  :two_pairs       => Hand.new(SortedDeck[0],  SortedDeck[2],  SortedDeck[4],  SortedDeck[6],  SortedDeck[10]),
  :pair            => Hand.new(SortedDeck[0],  SortedDeck[2],  SortedDeck[12], SortedDeck[27], SortedDeck[38]),
  :empty           => Hand.new(SortedDeck[0],  SortedDeck[13], SortedDeck[19], SortedDeck[28], SortedDeck[49]),
}

TestHands.each do |rank, hand|
  puts rank == hand.rank
end
