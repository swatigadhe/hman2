class PlayersController < ApplicationController

def index
  @players = Player.all
  
end

def new
  p params[:id]
  @id = params[:id]
  #p @@id
  #p @@id.class
  session[:gid] = params[:id]
  @player = Player.new
 
end

def create
  @player = Player.new(params[:player])
 p "//////////////////////"
 p session[:gid]
  #session[:gid] = params[:game_id]
  # Here we are finding list records related to game id selected.
    #we can use both ways written below
    #@list_ids = List.find(:all , :conditions => ["game_id = ?",  params[:game_id]])
    
     #@list_ids = List.find_all_by_game_id(params[:game_id])
     ##@list_ids = List.find_all_by_game_id(session[:gid])
  # Here we are finding exact randome id of list.  
    ##@list_id=@list_ids.shuffle.first

  # Here we are fetching single list record from seleted id.    
    ##@playerword= List.find_by_id(@list_id)  
    
    ##@hint = @playerword.hint
    ##session[:h]= @hint
    ##@img = @playerword.photo.url
    ##session[:i] = @img

  # Here we are fetching current word.  
    ##@player.word = @playerword.words.upcase
  
  
 # Here we fetch all records from db   
    @list = List.find(:all)
 # Here we shuffle records and find random id of list
    @lid = @list.shuffle.first
 # Here we fetch record related to that id   
    @word = List.find_by_id(@lid)
 # Here we current word and assign to player   
    @player.word = @word.words.upcase
    @hint = @word.hint
    session[:h] = @hint
    @img = @word.photo.url(:medium)
    p"//////////////////////////"
    p @img
    session[:i] = @img
    
 # @player.word = List.random_word
  @player.status = "playing"
  @player.guesses = ""
  @player.guess_string = ""
  @player.chancess_remain=7
  @player.save
  redirect_to @player
  
end

def show

 @player = Player.find(params[:id])
 # p session[:cw]
 @w=@player.word
 
 
  @nword = @w.gsub(/ /,'|').chomp
 @player.update_attributes(:word => @nword)

 @player.update_attributes(:url => session[:i])
 
 @current_word = @player.current_word()
 if @player.guess_string == @current_word
 @player.chancess_remain -=1
 end

@player.update_attributes(:guess_string => @current_word)
@player.update_attributes( :chancess_remain => @player.chancess_remain )

#p @player.chancess_remain


#p session[:cw]
 if @player.word == @current_word
@player.update_attributes( :status => 'win')
flash[:notice] = "You win the game"
else
  @player.update_attributes(:status => 'Lost')
end
end


def update

@player = Player.find(params[:id])
#if params[:player][:guesses] != ""
temp_guess = @player.guesses + params[:player][:guesses].to_s.upcase
@player.update_attributes(:guesses => temp_guess)

#else
#flash[:notice] = 'Enter a value!'
#end
redirect_to @player

end
end
