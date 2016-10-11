# ask for two numbers
# ask what to do with them
# do it
# print out result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  if number.to_f.to_s == number
    true
  else
    false
  end
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

prompt('Welcome to the Electric Table, enter your name')

name = ''
loop do
  name = Kernel.gets.chomp
  if name.empty?()
    prompt("Please use a valid name")
  else
    break
  end
end

loop do # main loop
  var1 = 0
  var2 = 0

  loop do
    prompt('What is the first number?')
    var1 = Kernel.gets().chomp()
    if valid_number?(var1)
      break
    else
      prompt('Not a valid number')
    end
  end
  loop do
    prompt('What is the secpmd number?')
    var2 = Kernel.gets().chomp()
    if valid_number?(var2)
      break
    else
      prompt('Not a valid number')
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add,
  2) subtract
  3)multiply
  4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers")

  answer =  case operator
            when '1'
              ar1.to_i + var2.to_i
            when '2'
              var1.to_i - var2.to_i
            when '3'
              var1.to_i * var2.to_i
            when '4'
              var1.to_f / var2.to_f
            end

  prompt("The answer is #{answer}")
  prompt("Do you want to perform another calcualtion? (Y)es or (N)o")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end

prompt('Goodbye')
