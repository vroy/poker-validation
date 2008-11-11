require 'snippets'
require 'deck'
require 'hand'
require 'card'
require 'table'

#require 'test' # Prints true if all the hands match

@table = Poker::Table.new(5)

puts @table.winner.rank


