class Game < ApplicationRecord
  LAST_GAMES_COUNT = 10

  has_many :game_achievements
  belongs_to :home_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'

  validates :date, presence: true

  scope :last_games, -> { order(date: :desc).limit(LAST_GAMES_COUNT) }
end
