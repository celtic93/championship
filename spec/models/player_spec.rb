require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should have_many :game_achievements }
  it { should belong_to :team }

  it { should validate_presence_of :name }

  let(:yesterday_game) { create(:game, date: Date.yesterday) }
  let(:games) { create_list(:game, 5) }
  let(:achievements) { create_list(:achievement, 2) }
  let(:player) { create(:player) }
  let(:player_games) { create_list(:game, 2, home_team: player.team)}
  let!(:today_game_achievement) { create(:game_achievement, player: player,
                                                            achievement: achievements[0],
                                                            game: games[0]) }
  let!(:yesterday_game_achievement) { create(:game_achievement, player: player,
                                                                achievement: achievements[1],
                                                                game: yesterday_game) }
  let!(:game_achievement) { create(:game_achievement) }

  it 'should has many games' do
    expect(player.games).to eq player_games
  end

  it 'checks if the player has reached the achievement' do
    expect(player).to be_achieved(achievements[0])
    expect(player).to_not be_achieved(achievements[1])
    expect(player).to_not be_achieved(game_achievement.achievement)
  end

  it 'checks if the player played in the game' do
    expect(player).to be_played_in(player_games[0])
    expect(player).to be_played_in(player_games[1])
    expect(player).to_not be_played_in(games[2])
  end
end
