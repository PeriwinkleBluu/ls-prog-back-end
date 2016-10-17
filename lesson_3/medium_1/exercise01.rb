stone_string = "The Flintstones Rock!"
space_string = ""

for i in 1..10
  puts space_string+stone_string
  space_string<<" "
end

#example answe did it in 1 line
10.times { |number| puts (" " * number)+ stone_string }