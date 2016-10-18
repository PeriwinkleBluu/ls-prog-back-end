munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

#Figure out the total age of just the male members of the family.
tot_age = 0
munsters.each do |key, details|
  tot_age += details["age"] if details["gender"] == "male"
end

p tot_age