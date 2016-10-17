#In another example we used some built-in string methods to 
#change the case of a string. A notably missing method is 
#something provided in Rails, but not in Ruby itself...titleize! 
#This method in Ruby on Rails creates a string that has each word 
#capitalized as it would be in a title.

#Write your own version of the rails titleize implementation.

def titlesize (str)
  arr=str.split(' ')
  arr.each do |i|
    i.capitalize!
  end
  arr.join(' ')
end

test_str = "this is a lowercase string"

p titlesize(test_str)

#the example version
def titlesize_ex (str) 
  str.split.map{ |word| word.capitalize}.join(' ')
end

p titlesize_ex(test_str)