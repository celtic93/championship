class Player < ApplicationRecord
  has_many :game_achievements
  belongs_to :team

  validates :name, presence: true
end
