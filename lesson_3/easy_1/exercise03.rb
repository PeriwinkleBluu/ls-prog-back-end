#Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.sub('important', 'urgent')
puts advice

#can use gsub! to mutate the object