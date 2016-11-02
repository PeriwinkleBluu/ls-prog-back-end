
require_relative 'twenty_one_methods'
score = { player: 0, dealer: 0 }

loop do
  current_deck = initialize_deck
  player_hand = []
  dealer_hand = []

  2.times do
    deal_card!(current_deck, player_hand)
    deal_card!(current_deck, dealer_hand)
  end

  player_plays(player_hand, dealer_hand, current_deck)

  if get_value(player_hand) <= MAX_VALUE
    dealer_plays(dealer_hand, current_deck)
  end

  winner = get_winner(player_hand, dealer_hand)
  keep_score!(winner, score)

  system 'clear'
  puts <<-DISPLAY_FINAL
The player had #{display_cards(player_hand)} for #{get_value(player_hand)} points.
The dealer had #{display_cards(dealer_hand)} for #{get_value(dealer_hand)} points.
#{winner} The score is currently PLAYER:#{score[:player]} DEALER:#{score[:dealer]}
  DISPLAY_FINAL

  if score.value?(5)
    puts <<-FINAL_SCORE
The Player won #{score[:player]} times and
The Dealer won #{score[:dealer]} times
    FINAL_SCORE
  end

  puts "Would you like to play again? (Y)es or (N)o"
  answer = gets.chomp.downcase
  break unless answer[0] == 'y'
end

puts "Thanks for playing!"
