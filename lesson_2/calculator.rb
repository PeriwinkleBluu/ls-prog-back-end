#ask for two numbers
#ask what to do with them
#do it
#print out result

#answer = Kernel.gets()
#Kernel.puts(answer)

Kernel.puts("Welcome to the Electric Table")

Kernel.puts("What is the first number?")
var_1=Kernel.gets().chomp()

#Kernel.puts(var_1.inspect)

p#uts("The first number is "+var_1+"!")


Kernel.puts("What is the first number?")
var_2=Kernel.gets().chomp()
#puts("The second number is "+var_2+"!")

Kernel.puts("What operation would you like to perform? 1) add, 2) subtract 3)multiply 4) divide")
operator = Kernel.gets.chomp

case operator
when "1"
  puts var_1.to_i + var_2.to_i
when "2"
  puts var_1.to_i - var_2.to_i
when "3"
    puts var_1.to_i * var_2.to_i
when "4"
    puts var_1.to_f / var_2.to_f
else
  puts "Not a valid choice."
end