
# methds to support playing 21
require_relative '21_methods'

loop do
  current_deck = initialize_deck
  player_hand = []
  dealer_hand = []

  dealer_hand << deal_card!(current_deck)
  player_hand << deal_card!(current_deck)
  dealer_hand << deal_card!(current_deck)

  player_plays(player_hand, dealer_hand, current_deck)

  if get_value(player_hand) <= 21
    dealer_plays(dealer_hand, current_deck)
  end

  puts "The player had #{display_cards(player_hand)} for #{get_value(player_hand)} points"
  puts "The dealer had #{display_cards(dealer_hand)} for #{get_value(dealer_hand)} points"
  puts get_winner(player_hand, dealer_hand)

  puts "Would you like to play again? (Y)es or (N)o"
  answer = gets.chomp.downcase
  break unless answer[0] == 'y'
end
