class Player < ActiveRecord::Base
  attr_accessible :guesses, :name, :status, :word, :chancess_remain, :guess_string, :url
  
 
  
  def current_word()
    
    str1 = ""
    word.each_char.with_index do|ch,index|
       if guesses.include? ch
         str1[index] = ch
         elsif ch == '|'
          str1[index] = '|'
         else
          str1[index] = "_"
       end   
  end
      #Player.update(id,:chancess_remain=>@@chances)
   return str1
 end 
end
