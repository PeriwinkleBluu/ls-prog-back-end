#Back in the stone age (before CSS) we used spaces to align 
#things on the screen. If we had a 40 character wide table 
#of Flintstone family members, how could we easily center that 
#title above the table with spaces?

title = "Flintstone Family Members"

center_spaces = (40-title.length)/2

empty_spaces = " "*center_spaces

table_length = "x"*40

p empty_spaces+title
p table_length

p " "

#from the solution use the center method
p title.center(40)
p table_length