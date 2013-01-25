class ListsController < ApplicationController
def create
    @game = Game.find(params[:game_id])
    @list = @game.lists.create(params[:list])
    
    respond_to do |format|
      if @list.save
      
        format.html{ redirect_to game_path(@game)}
      else
        format.html { redirect_to game_path(@game,:error=> @list.errors[:words].first)}
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    
    end
  end
end
