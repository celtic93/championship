class AchievementsController < ApplicationController
  before_action :find_player
  before_action :find_achievement
  before_action :find_game, only: %i(create)

  def show
    @achieved = @player.achieved?(@achievement)

    render json: { achieved: @achieved }
  end

  def create
    if @player.played_in?(@game)
      @game_achievement = @player.game_achievements.find_or_create_by(achievement: @achievement, game: @game)
      render json: @game_achievement
    else
      render json: { message: 'player not played in this game' }
    end
  end

  private

  def find_player
    @player = Player.find(params[:player_id])
  end

  def find_achievement
    @achievement = Achievement.find(params[:id])
  end

  def find_game
    @game = Game.find(params[:game_id]).includes(:home_team, :guest_team)
  end
end
