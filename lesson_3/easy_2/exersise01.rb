ges = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#see if "Spot" is present.

#if Spot was a key in the array with a value of false this would not work
if ges["Spot"]
  puts "Spot is in the array"
else
  puts "Spot is not in the array"
end

#Bonus: What are two other hash methods that would work just as well 
#for this solution?

#key? returns truw if the key is present in hash
#has_key? does te same
#include? does the same

#from answer
#member?