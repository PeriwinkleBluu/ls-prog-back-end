# A file to hold the methods used in the mortgage calculator program

def prompt(message)
  puts("::: #{message}")
end

def valid_number?(number)
  if number.to_i.to_s == number && number.to_i > 0
    true
  else
    false
  end
end

def valid_apr?(apr)
  if apr.to_i > 0 && apr.to_i <= 100
    true
  else
    false
  end
end

# get amount of loan
def request_amt
  amt = ''
  loop do
    prompt('What is the loan amount in whole dollars')
    amt = gets.chomp
    if valid_number?(amt)
      return amt
    else
      prompt('Not a valid loan amount, please enter only numbers')
    end
  end
end

# get APR on loan
def request_apr
  apr = ''
  loop do
    prompt('What is the APR expressed as a number between 0 and 100')
    apr = gets.chomp
    if valid_apr?(apr)
      return apr
    else
      prompt('Not a valid loan amount')
    end
  end
end

# get duration in years
def request_dur
  dur = ''
  loop do
    prompt('What is the loan duration in years')
    dur = gets.chomp
    if valid_number?(dur)
      return dur
    else
      prompt('not a valid duration in years')
    end
  end
end
