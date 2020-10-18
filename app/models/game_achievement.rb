class GameAchievement < ApplicationRecord
  belongs_to :achievement
  belongs_to :game
  belongs_to :player
end
