#Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age_sum=0

ages.each_value do |value|
  age_sum+=value
end

puts "The total age of the people is #{age_sum}"

#example answe
puts ages.values.inject(:+)
#from enmumerable 