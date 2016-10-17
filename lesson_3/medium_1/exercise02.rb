#Create a hash that expresses the frequency with which 
#each letter occurs in this string:

#walk through the statement 1X if the letter has been seen before
#increment it, if it hasnt add that to hash
statement = "The Flintstones Rock"
freq_hash = {}

statement.each_char do |c|
  if freq_hash.include?(c)
    freq_hash[c]+=1
  else
    freq_hash[c]=1
  end
end

p freq_hash

#example solution walks through the statment 2X length of alphabet
#if it finds one or more it adds that to the hash table
