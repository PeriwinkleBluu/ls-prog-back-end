SUITS = ["\u2660", "\u2661", "\u2662", "\u2663"].freeze
MAX_VALUE = 21.freeze
DEALER_STOP = 17

# reset deck to full cards
def initialize_deck
  [["A", 0], ["2", 0], ["3", 0], ["4", 0], ["5", 0], ["6", 0], ["7", 0]] +
    [["8", 0], ["9", 0], ["10", 0], ["J", 0], ["Q", 0], ["K", 0]] +
    [["A", 1], ["2", 1], ["3", 1], ["4", 1], ["5", 1], ["6", 1], ["7", 1]] +
    [["8", 1], ["9", 1], ["10", 1], ["J", 1], ["Q", 1], ["K", 1]] +
    [["A", 2], ["2", 2], ["3", 2], ["4", 2], ["5", 2], ["6", 2], ["7", 2]] +
    [["8", 2], ["9", 2], ["10", 2], ["J", 2], ["Q", 2], ["K", 2]] +
    [["A", 3], ["2", 3], ["3", 3], ["4", 3], ["5", 3], ["6", 3], ["7", 3]] +
    [["8", 3], ["9", 3], ["10", 3], ["J", 3], ["Q", 3], ["K", 3]]
end

# returns a string of cards for the user to read
def display_cards(card_list)
  hand = []
  card_list.each do |card|
    hand << "#{card[0]}#{SUITS[card[1]]}"
  end
  hand.join(" ")
end

# returns the value of the cards in the hand
def get_value(card_list)
  value = 0
  # calculate initial value
  card_list.each do |card|
    # check for Ace
    value += if card[0] == 'A'
               11
             # check for Royal
             elsif card[0].to_i.zero? # 'J', 'Q', 'K'
               10
             # number
             else
               card[0].to_i
             end
  end
  # if value is over 21 and the player has an A recalculate
  if value > MAX_VALUE && card_list.any? { |i| [["A", 0], ["A", 1], ["A", 2], ["A", 3]].include? i }
    value = calc_a_value(card_list, value)
  end
  value
end

# for calculating hand value if an ace is given and value is over 21
def calc_a_value(card_list, value)
  count = 0
  # find how many aces
  (0..3).each do |i|
    if card_list.include?(["A", i])
      count += 1
    end
  end
  # turn the minimum required into 1s
  while value > MAX_VALUE && count > 0
    value -= 10
    count -= 1
  end
  value
end

# removes a card from the list and returns it
def deal_card!(card_list)
  card_list.delete_at rand card_list.length
end

def player_plays(player_hand, dealer_hand, current_deck)
  loop do
    system 'clear'
    puts "The dealer has #{display_cards([dealer_hand[0]])} and ??"
    puts "Your hand is: #{display_cards(player_hand)}"
    puts "Your hand is currently worth #{get_value(player_hand)} points"
    puts 'Would you like to (h)it or (s)tay?'
    answer = gets.chomp.downcase
    break unless answer[0] == 'h'
    player_hand << deal_card!(current_deck)
    if get_value(player_hand) > MAX_VALUE
      puts "You Busted!"
      break
    end
  end
end

def dealer_plays(dealer_hand, current_deck)
  while get_value(dealer_hand) < DEALER_STOP
    dealer_hand << deal_card!(current_deck)
  end
end

def get_winner(player_hand, dealer_hand)
  if (get_value(player_hand) <= MAX_VALUE && get_value(player_hand) > get_value(dealer_hand)) || get_value(dealer_hand) > MAX_VALUE
    "Player Wins!"
  else
    "Dealer Wins!"
  end
end
