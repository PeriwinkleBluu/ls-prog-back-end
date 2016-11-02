# print suits using their unicode value
SUITS = ["\u2660", "\u2661", "\u2662", "\u2663"].freeze
MAX_VALUE = 21
DEALER_STOP = 17

def initialize_deck
  suit_numbers = *(0..3)
  values = *(2..10).map(&:to_s) + ["A", "K", "Q", "J"]

  values.product(suit_numbers)
end

def display_cards(card_list)
  hand = []
  card_list.each do |card|
    hand << "#{card[0]}#{SUITS[card[1]]}"
  end
  hand.join(" ")
end

def get_value(card_list)
  value = 0
  card_list.each do |card|
    value += if card[0] == 'A'
               11
             elsif card[0].to_i.zero? # 'J', 'Q', 'K'
               10
             else
               card[0].to_i
             end
  end
  # if value is over 21 and the player has an A recalculate
  if value > MAX_VALUE
    value = calc_a_value(card_list, value)
  end
  value
end

def calc_a_value(card_list, value)
  card_list.count { |i| i[0] == "A" }.times do
    value -= 10 if value > MAX_VALUE
  end
  value
end

# removes card from deck and adds it to hand
def deal_card!(card_list, hand)
  hand << card_list.delete_at(rand(card_list.length))
end

def player_plays(player_hand, dealer_hand, current_deck)
  loop do
    system 'clear'
    puts <<-CURR_GAMESTATE
"The dealer has #{display_cards([dealer_hand[0]])} and ??
Your hand is: #{display_cards(player_hand)}
Your hand is currently worth #{get_value(player_hand)} points.
Would you like to (h)it or (s)tay?
    CURR_GAMESTATE
    break unless gets.chomp.casecmp('h').zero?
    deal_card!(current_deck, player_hand)
    if get_value(player_hand) > MAX_VALUE
      puts "You Busted!"
      break
    end
  end
end

def dealer_plays(dealer_hand, current_deck)
  while get_value(dealer_hand) < DEALER_STOP
    deal_card!(current_deck, dealer_hand)
  end
end

def get_winner(player_hand, dealer_hand)
  deal_points = get_value(dealer_hand)
  player_points = get_value(player_hand)
  if (player_points <= MAX_VALUE && player_points > deal_points) ||
     deal_points > MAX_VALUE
    "The player wins!"
  elsif player_points == deal_points
    "It's a tie!"
  else
    "The dealer wins!"
  end
end

def keep_score!(winner, score)
  if winner == "The player wins!"
    score[:player] += 1
  elsif winner == "The dealer wins!"
    score[:dealer] += 1
  end
end
