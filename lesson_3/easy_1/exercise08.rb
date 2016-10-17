flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones

flintstones.flatten!

p flintstones
#use flatten with no ! to return the value instead of mutating