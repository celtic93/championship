class GameAchievementSerializer < ActiveModel::Serializer
  :player, :achievement, :game

  def player
    object.player.name
  end

  def achievement
    object.achievement.title
  end

  def game
    object.game.title
  end
end