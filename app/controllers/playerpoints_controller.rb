class PlayerpointsController < ApplicationController
  def add
    redirect_to "/admin/login" and return if loggedin? == false
    @playerpoints = Playerrank.new;
  end

  def create
    redirect_to "/admin/login" and return if loggedin? == false
    p = Playerrank.new
    p.scaledpoints = 0
    p.totalpoints = 0
    par = params[:playerrank]
    p.game = Game.find(par[:game].to_i)
    p.player = Player.find(par[:player].to_i)
    @success = p.save
  end

  def calculateall
    redirect_to "/admin/login" and return if loggedin? == false
    puts "calc"
    Playerrank.all.each do |p|
      p.scaledpoints = 0
      p.totalpoints = 0
      p.save
    end
    puts "calc2"

    Game.all.each do |game|
      puts "calc for " + game.name
      scale = 1
      Tournament.order(:date).reverse_order.where(:game_id => game.id).each do |tourney|
        Tourneyresult.where(:tournament_id => tourney.id).each do |result|
          pr = Playerrank.find(result.playerrank_id)
          pr.totalpoints = pr.totalpoints + result.points
          pr.scaledpoints = pr.scaledpoints + result.points * scale
          pr.save
        end
        if scale > 0
          scale -= 0.125
        end
      end
    end

  end
end
