require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:games) { create_list(:game, 2) }
  let(:first_game_title) { "#{games[0].home_team.name} : #{games[0].guest_team.name}" }
  let(:second_game_title) { "#{games[1].home_team.name} : #{games[1].guest_team.name}" }
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET #index' do
    before { get :index }

    it 'populates an array of last games' do
      expect(assigns(:games)).to match_array(games)
    end

    it 'returns game id' do
      expect(response_body[0]['id']).to eq games[0].id
      expect(response_body[1]['id']).to eq games[1].id
    end

    it 'returns game title' do
      expect(response_body[0]['title']).to eq first_game_title
      expect(response_body[1]['title']).to eq second_game_title
    end

    it 'returns 200 status' do
      expect(response).to be_successful
    end
  end
end
