
VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts(" => #{message} ")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer)
  if player == computer
    prompt "You tied."
  elsif win?(player, computer)
    prompt('you win!')
  else
    prompt('You lose.')
  end
end

def get_choice(u_choice)
  VALID_CHOICES.each do |choice|
    return choice if choice.start_with?(u_choice)
  end
end

u_wins = 0
c_wins = 0
prompt("welcome to #{VALID_CHOICES.join(', ')}, the'\
'first to 5 wins takes the whole shebang.")

loop do
  choice = ''
  loop do
    prompt('Choose one: (r)ock, (p)aper (sc)issors, (l)izard, (sp)ock')
    temp_choice = gets.chomp.downcase
    choice = get_choice(temp_choice)
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and the computer chose #{computer_choice}.")

  display_results(choice, computer_choice)
  if win?(choice, computer_choice)
    u_wins += 1
  elsif win?(computer_choice, choice)
    c_wins += 1
  end

  prompt("The score is you: #{u_wins}, computer: #{c_wins}")
  if u_wins == 5
    prompt("You win the whole shebang!")
    break
  elsif c_wins == 5
    prompt("You lost the whole shebang! :P")
    break
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("thank you for playing!")
