#Programmatically determine if 42 lies between 10 and 100.
number = 42

for i in (10..100)
  if i == number
    puts("#{number} is between 10 and 100")
    break
  end
end


#easier solution using cover?

p (10..100).cover?(42)