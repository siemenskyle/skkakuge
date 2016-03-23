class GamesController < ApplicationController
  def view
    gameparam = params[:name]
    @name = params[:name]
    @game = Game.find_by_name(gameparam)
    @ranks = Playerrank.order(:scaledpoints).reverse_order.where(:game_id => @game.id)
  end

  def add
    redirect_to "/admin/login" and return if loggedin? == false
  end

  def create
    redirect_to "/admin/login" and return if loggedin? == false
    game = Game.new
    game.name = params[:name]
    game.longname = params[:longname]
    @success = game.save
  end


end
