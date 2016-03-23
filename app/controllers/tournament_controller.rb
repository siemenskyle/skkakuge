class TournamentController < ApplicationController
  def add
    redirect_to "/admin/login" and return if loggedin? == false
    @tournament = Tournament.new
  end

  def create
    redirect_to "/admin/login" and return if loggedin? == false
    @t = Tournament.new(params.require(:tournament).permit(:name, :date))
    @t.game_id = params[:tournament][:game]
    @t.save
    @entrants = params[:tournament][:id].to_i

    @results = []
    @entrants.times do
      @results << Tourneyresult.new
    end
  end

  def createresults
    redirect_to "/admin/login" and return if loggedin? == false
    tourney_id = params[:tid]
    params['results'].each do |r|
      result = Tourneyresult.new
      result.placing = r[:placing]
      result.points = r[:points]
      result.playerrank_id = r[:playerrank_id]
      result.tournament_id = tourney_id
      result.save
    end
  end

  def view
    idparam = params[:id]
    @tournament = Tournament.find(idparam)
    @rank = Tourneyresult.order(:placing).where(:tournament_id => @tournament.id)
  end

  def delete
    redirect_to "/admin/login" and return if loggedin? == false
    tourney_id = params[:tid]
    Tourneyresult.where(:tournament_id => tourney_id) do |r|
      r.destroy
    end
    t = Tournament.find(tourney_id)
    t.destroy
  end
end
