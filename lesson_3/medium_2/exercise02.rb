munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#Given this previously seen family hash, print out the 
#name, age and gender of each family member:

munsters.each do |val, det|
  puts "#{val} is a #{det["age"]} year old #{det["gender"]}"
end
