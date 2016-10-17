#In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#Find the index of the first name that starts with "Be"

p flintstones

#returns wrong thing
p flintstones.find { |i| i.include? "Be"  }

#example uses index
p flintstones.index { |i| i.include? "Be"}