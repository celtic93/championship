class AchievementsController < ApplicationController
  def show
    @player = Player.find(params[:player_id])
    @achievement = Achievement.find(params[:id])
    @achieved = @player.achieved?(@achievement)

    render json: { achieved: @achieved }
  end
end
