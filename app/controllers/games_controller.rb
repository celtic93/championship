class GamesController < ApplicationController
  def index
    @games = Game.last_games.includes(:home_team, :guest_team)
    render json: @games
  end
end
