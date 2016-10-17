flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

#unnecessary loop read problem
#flintstones.each do |key, value|
#  puts key+" "+value.to_s
#end

Barney_arr = [flintstones["Barney"], "Barney"]
p Barney_arr

p flintstones.assoc("Barney")