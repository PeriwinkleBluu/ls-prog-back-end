# What do you expect to happen when the greeting variable
# is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

#an unassigned variable error - wrong

#in ruby if a variable is initialized inside an if block and it
#never gets created it will just be set to nil