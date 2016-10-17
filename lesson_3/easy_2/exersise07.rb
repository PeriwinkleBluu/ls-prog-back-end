#See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."

if advice.include? "Dino"
  p "Dino is in the string"
else
  p "Dino is not in the string"
end

#example uses match
if advice.match "Dino"
  p "Dino is in the string"
else
  p "Dino is not in the string"
end
