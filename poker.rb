require 'snippets'
require 'deck'
require 'hand'
require 'card'
# require 'test' # Prints true if all the hands match

deck = Deck.new.sort

hands = deck.deal(5) # Deal 5 hands, returns an hash indexed from 0 to 4 each containing an Hand object

p hands[0]
p hands[1]
p hands[2]
p hands[3]
p hands[4]
p hands[5]
