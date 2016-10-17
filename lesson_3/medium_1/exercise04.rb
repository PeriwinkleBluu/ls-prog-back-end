#What happens when we modify an array while we are 
#iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
#removes the first element of the array
#print 1, remove 1. now the array is [2,3,4]
#print at index [1] so print 3, shift off number 2
#nothing at index 2, end

#What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
#pop removes the last element from self
#print 1, pop 4
#print 2, pop 3
#array empty