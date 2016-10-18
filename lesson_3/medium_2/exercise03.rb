#How can we refactor this exercise to make the result easier 
#to predict and easier for the next programmer to maintain?

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#my version

def understandable_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string2 = "pumpkins"
my_array2 = ["pumpkins"]
my_string2, my_array2 = understandable_method(my_string2, my_array2)

puts "My string2 looks like this now: #{my_string2}"
puts "My array2 looks like this now: #{my_array2}"