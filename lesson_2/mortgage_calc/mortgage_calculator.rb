# get the loan amount, APR, and Duration
# calculate monthly interest rate
# calculate loan duration in moths

# get the methods from the other file loaded in
load 'mortgage_methods.rb'

# greet the user
prompt "Welcome to your mortgage calculating experience"

# set up variables
amt = ''
apr = ''
dur_y = ''

# outer loop to allow for multiple calculations
loop do
  # get the information from the user, keep looping until
  # everything is legit
  loop do
    prompt "Please inpute your loan amount in dollars"
    amt = request_amt
    prompt "Please inpute your APR as a number between 0 and 100"
    apr = request_apr
    prompt "Please inpute your loan duration in years"
    dur_y = request_dur

    prompt "The loan amount is $#{amt}, The APR is #{apr}% and the"\
    " loan duration is #{dur_y} years."

    prompt "Is this correct: (Y)es or (N)o"
    correct_input = gets.chomp
    if correct_input.downcase.start_with?('y')
      break
    else
      next
    end
  end

  # now to fix the variables for calculation
  amt = amt.to_i
  # change apr to a decimal percentage
  apr = apr.to_f / 100
  # find the monthly percentage rate
  mpr = apr / 12
  dur_y = dur_y.to_i
  # find the duration in months
  dur_m = dur_y * 12

  # now do the math
  pay_m = amt * (mpr / (1 - (1 + mpr)**-dur_m))
  # some code i found on stackoverflow to make dollars look pretty
  payment = format("%05.2f", pay_m)

  prompt "your monthly payment will be $#{payment}"

  prompt("Do you want to perform another calcualtion? (Y)es or (N)o")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
