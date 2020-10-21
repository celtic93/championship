class Player < ApplicationRecord
  LAST_MATCHES_COUNT = 5

  has_many :game_achievements
  has_many :games, ->(user) { unscope(where: :player_id).where("home_team_id = ? OR guest_team_id = ?", user.team_id, user.team_id) }
  belongs_to :team

  validates :name, presence: true

  def achieved?(achievement)
    games_ids = Game.order(date: :desc).limit(LAST_MATCHES_COUNT).pluck(:id)
    GameAchievement.exists?(player_id: id, achievement_id: achievement.id, game_id: games_ids)
  end

  def played_in?(game)
    games.include?(game)
  end
end
