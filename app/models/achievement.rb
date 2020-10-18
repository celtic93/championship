class Achievement < ApplicationRecord
  has_many :game_achievements
  
  validates :title, presence: true
end
