require 'rails_helper'

RSpec.describe AchievementsController, type: :controller do
  let(:player) { create(:player) }
  let(:achievement) { create(:achievement) }
  let(:game_achievement) { create(:game_achievement, player: player, achievement: achievement) }
  let(:achieved) { player.achieved?(achievement) }
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET #show' do
    context 'for valid params' do
      before { get :show, params: { id: achievement, player_id: player } }

      it 'assigns the requested player to @player' do
        expect(assigns(:player)).to eq player
      end

      it 'assigns the requested achievement to @achievement' do
        expect(assigns(:achievement)).to eq achievement
      end

      it "assigns player's achieved method result to @achieved" do
        expect(assigns(:achieved)).to eq achieved
      end

      it 'returns achieved info' do
        expect(response_body['achieved']).to eq achieved
      end

      it 'returns 200 status' do
        expect(response).to be_successful
      end
    end

    context 'for invalid params' do
      before { get :show, params: { id: 1000, player_id: 1000 } }

      it 'returns error message' do
        expect(response_body['error']).to eq "Couldn't find Player with 'id'=1000"
      end

      it 'returns 404 status' do
        expect(response.status).to eq(404)
      end
    end
  end
end
