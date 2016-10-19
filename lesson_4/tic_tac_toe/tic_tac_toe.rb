require 'pry'

INITIAL_MARKER = ' '.freeze
PLATER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
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

def computer_places_piece(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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
loop do
  board = initialize_board
  display_board(board)

  loop do
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece(board)
    break if someone_won?(board) || board_full?(board)
    display_board(board)
  end

  display_board(board)
  if someone_won?(board)
    winner = detect_winner(board) == PLATER_MARKER ? 'Player' : 'Computer'
    prompt "#{winner} won"
  else
    prompt "It is a tie"
  end
  prompt "would you like to play again (Y)es or (N)o"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing, ciao"
