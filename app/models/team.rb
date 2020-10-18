class Team < ApplicationRecord
  has_many :games, ->(team) { unscope(where: :team_id).where("home_team_id = ? OR guest_team_id = ?", team.id, team.id) }

  validates :name, presence: true
end
