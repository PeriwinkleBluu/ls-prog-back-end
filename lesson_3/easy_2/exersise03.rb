#In the age hash:throw out the really old people (age 100 or older).
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages

ages.delete_if{|_, value| value>=100}

p ages

#problem solution uses keep_if instead of delete_if
ages.keep_if{ |_, age| age < 100 }
