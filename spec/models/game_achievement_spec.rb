require 'rails_helper'

RSpec.describe GameAchievement, type: :model do
  it { should belong_to :achievement }
  it { should belong_to :game }
  it { should belong_to :player }

  before { create(:game_achievement) }
  it { should validate_uniqueness_of(:player_id).scoped_to(:game_id, :achievement_id) }
end
