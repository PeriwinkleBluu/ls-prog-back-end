#What is the output of the following code?

answer = 42

#this method does not alter some number, but it returns
#some number plus 8
def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)
#answer is still 42
p answer - 8
#new anser is 50 
p new_answer