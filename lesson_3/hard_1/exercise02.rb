# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#greetings[:a] is a reference to the 'hi'
#<< shoves things in and mutates them
#prints a: => hi there
