

def uuid_creator
  #make array of possible inputs
  hex_arr = ('a'..'f').to_a+['0','1','2','3','4','5','6','7','8','9']
  uuid = ""
  #fill string with 32 hex characters
  while uuid.length<32 
    uuid << hex_arr.sample
  end
  #add dashes into appropriate spots
  uuid.insert(20, '-').insert(16, '-').insert(12, '-').insert(8, '-')
end

p uuid_creator

  