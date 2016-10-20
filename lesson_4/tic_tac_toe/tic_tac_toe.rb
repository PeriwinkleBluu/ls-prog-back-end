require 'pry'

INITIAL_MARKER = ' '.freeze
PLATER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
current_player='Player'

def prompt(msg)
  puts "=>#{msg}"
end

def joinor(arr, sep = ", ", fin ='or')
  if arr.length > 2
    temp = arr.join(sep)
    temp.insert(temp.rindex(' ')," #{fin}")
  elsif arr.length ==2
    temp = arr.join(' ')
    temp.insert(temp.rindex(' ')," #{fin}")
  else
    arr[0].to_s
  end
end

def display_board(brd)
  system 'clear'
  puts "You're are #{PLATER_MARKER}, Computer is #{COMPUTER_MARKER}"
  puts ''
  puts "#{brd[1]}|#{brd[2]}|#{brd[3]}"
  puts '-----'
  puts "#{brd[4]}|#{brd[5]}|#{brd[6]}"
  puts '-----'
  puts "#{brd[7]}|#{brd[8]}|#{brd[9]}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt "choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if brd[square] == INITIAL_MARKER
    prompt "That input is invalid"
  end
  brd[square] = PLATER_MARKER
end
#my threat finder
#def threat_sqr(brd, line, sym)
#  matches=0
#  sqr = nil
#  line.each do |i| 
#    if brd[i] == sym
#      matches+=1
#    elsif brd[i] == ' '
#      sqr = i
#    end
#  end
#  matches == 2 ? sqr : nil 
#end

def threat_sqr(brd, line, sym)
  if brd.values_at(*line).count(sym)==2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  sqr = nil
  #place in winning square
  WINNING_LINES.each do |line|
    sqr =  threat_sqr(brd,line, COMPUTER_MARKER )
    break if sqr
  end
  
  #place in defending square
  if !sqr
    WINNING_LINES.each do |line|
      sqr =  threat_sqr(brd,line, PLATER_MARKER )
      break if sqr
    end
  end
  #place in 5 if available
  if !sqr
    empty_squares(brd).include?(5) ? sqr=5 : nil
  end
  #choose randomly
  if !sqr
    sqr = empty_squares(brd).sample
  end
  
  brd[sqr] = COMPUTER_MARKER
end

def place_piece!(brd, plyr)
  plyr == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(plyr)
  plyr == 'Player' ? 'Computer' : 'Player'
end

def set_player(plyr)
  plyr == 'c' ? 'Computer' : 'Player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if  brd[line[0]] != INITIAL_MARKER &&
    #    brd[line[0]] == brd[line[1]] &&
    #    brd[line[1]] == brd[line[2]]
    #  return brd[line[0]].to_s
    # end
    if brd.values_at(*line).count(PLATER_MARKER) == 3 ||
       brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return brd[line[0]].to_s
    end
  end
  nil
end


player_wins = 0
computer_wins=0

loop do
  board = initialize_board
  display_board(board)
  prompt "Should the (C)omputer or (P)layer go first?"
  first_player = gets.chomp.downcase.chars.first
  current_player = set_player(first_player)

#  loop do
#    player_places_piece!(board)
#    break if someone_won?(board) || board_full?(board)
#    computer_places_piece(board)
#   break if someone_won?(board) || board_full?(board)
#    display_board(board)
#  end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  if someone_won?(board)
    winner = detect_winner(board) == PLATER_MARKER ? 'Player' : 'Computer'
    if winner== 'Player'
      player_wins+=1
    else
      computer_wins+=1
    end
    if player_wins<5 && computer_wins<5
      prompt "#{winner} won, the score is Player:#{player_wins} Computer:#{computer_wins}"
    else
      prompt "#{winner} wins the whole shebang"
      break
    end
  else
    prompt "It is a tie"
  end
  prompt "would you like to play again (Y)es or (N)o"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing, ciao"
