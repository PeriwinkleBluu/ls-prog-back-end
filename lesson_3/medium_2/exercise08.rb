#Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

#What would be the output of this code:
#bar(foo)
#foo param is set to no automatically, but it returns yes
#so we get bar("yes")
#param != no so bar("yes") returns "no"

p bar(foo)