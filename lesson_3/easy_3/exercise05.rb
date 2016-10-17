#Write a one-liner to count the number of lower-case 't' characters 
#in the following string:

statement = "The Flintstones Rock!"

num_ts=0
statement.scan('t') { |char| num_ts+=1 }
p num_ts

#answers oneline version

statement.scan('t').count