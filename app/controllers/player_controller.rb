class PlayerController < ApplicationController
  def view
    id = params[:id]
    @player = Player.find(id)
  end

  def all
    @players = Player.all
  end

  def add
    redirect_to "/admin/login" and return if loggedin? == false
    @player = Player.new
  end

  def create
    redirect_to "/admin/login" and return if loggedin? == false
    p = Player.new(params.require(:player).permit(:name, :aliases))
    @success = p.save
    #player = Player.new
    #player.name = params[:name]
    #player.aliases = params[:aliases]
    #@success = player.save
  end

  def remove
    redirect_to "/admin/login" and return if loggedin? == false
  end
end
