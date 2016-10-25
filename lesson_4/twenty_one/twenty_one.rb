
# methds to support playing 21
require_relative 'twenty_one_methods'
score = [0,0]

loop do
  #initialize deck, player, and dealers hands
  current_deck = initialize_deck
  player_hand = []
  dealer_hand = []
  #draw cards for player and dealer
  2.times do
    player_hand << deal_card!(current_deck)
    dealer_hand << deal_card!(current_deck)
  end

  #player hit or stay loop
  player_plays(player_hand, dealer_hand, current_deck)

  #if the player hasn't busted the dealer begins playing
  if get_value(player_hand) <= MAX_VALUE
    dealer_plays(dealer_hand, current_deck)
  end

  #get the winner and keep track of winners
  winner = get_winner(player_hand, dealer_hand)
  keep_score!(winner, score)

  #Display the final hands and values for the player and the dealer,as well as the winner
  system 'clear'
  puts "The player had #{display_cards(player_hand)} for #{get_value(player_hand)} points."
  puts "The dealer had #{display_cards(dealer_hand)} for #{get_value(dealer_hand)} points."
  puts "#{winner} The score is currently PLAYER:#{score[0]} DEALER:#{score[1]}"
  #break out of the loop if either has won 5 times
  if score[0] == 5
    puts "The player has won 5 times!"
    break
  elsif score[1] == 5
    puts "The dealer has won 5 times"
    break
  end

  #See if the player wants to play again.
  puts "Would you like to play again? (Y)es or (N)o"
  answer = gets.chomp.downcase
  break unless answer[0] == 'y'
end


puts "Thanks for playing!"