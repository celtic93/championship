class Player < ApplicationRecord
  LAST_MATCHES_COUNT = 5

  has_many :game_achievements
  belongs_to :team

  validates :name, presence: true

  def achieved?(achievement)
    games_ids = Game.order(date: :desc).limit(5).pluck(:id)
    GameAchievement.exists?(player_id: id, achievement_id: achievement.id, game_id: games_ids)
  end
end
