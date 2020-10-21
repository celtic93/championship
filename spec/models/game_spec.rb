require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_many :game_achievements }
  it { should belong_to(:home_team).class_name('Team') }
  it { should belong_to(:guest_team).class_name('Team') }

  it { should validate_presence_of :date }

  let(:yesterday_game) { create(:game, date: Date.yesterday) }
  let(:games) { create_list(:game, 10) }
  let(:game) { games[0] }
  let(:last_games) { Game.last_games }

  it 'contains last 10 games' do
    games.each { |game| expect(last_games).to include(game) }
    expect(last_games).to_not include(yesterday_game)
  end

  it 'shows game title' do
    expect(game.title).to eq 'Team Name : Team Name'
  end
end
