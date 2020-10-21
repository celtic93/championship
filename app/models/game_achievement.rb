class GameAchievement < ApplicationRecord
  belongs_to :achievement
  belongs_to :game
  belongs_to :player

  validates :player_id, uniqueness: { scope: [:game_id, :achievement_id] }
end
