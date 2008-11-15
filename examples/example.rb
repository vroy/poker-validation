require '../lib/poker'

@table = Poker::Table.new(3)

@table.hands.each do |hand|
  puts "#{hand}"
end

index, hand = @table.winner

puts
puts "Winning index: #{index}"
puts "Winning hand: #{hand}"
