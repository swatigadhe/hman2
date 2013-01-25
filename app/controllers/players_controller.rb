class PlayersController < ApplicationController

def index
  @players = Player.all
end

def new
  @player = Player.new
end

def create
  @player = Player.new(params[:player])
  @player.word = List.random_word
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
