require 'rails_helper'

RSpec.describe AchievementsController, type: :controller do
  let(:player) { create(:player) }
  let(:achievement) { create(:achievement) }
  let(:game) { create(:game, home_team: player.team) }
  let(:other_game) { create(:game) }
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET #show' do
    let(:game_achievement) { create(:game_achievement, player: player, achievement: achievement) }
    let(:achieved) { player.achieved?(achievement) }

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

  describe 'POST #create' do
    context 'player played in the game' do
      it 'assigns the requested player to @player' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: game.id }

        expect(assigns(:player)).to eq player
      end

      it 'assigns the requested achievement to @achievement' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: game.id }

        expect(assigns(:achievement)).to eq achievement
      end

      it 'assigns the requested game to @game' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: game.id }

        expect(assigns(:game)).to eq game
      end

      it 'saves a new game achievement in database' do
        expect { post :create, params: { player_id: player.id,
                                         id: achievement.id,
                                         game_id: game.id } }.to change(player.game_achievements, :count).by(1)
      end

      it 'returns game achievement info' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: game.id }

        expect(response_body['player']).to eq player.name
        expect(response_body['achievement']).to eq achievement.title
        expect(response_body['game']).to eq game.title
      end

      it 'returns 200 status' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: game.id }

        expect(response).to be_successful
      end
    end

    context 'player did not played in the game' do
      it 'assigns the requested player to @player' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: other_game.id }

        expect(assigns(:player)).to eq player
      end

      it 'assigns the requested achievement to @achievement' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: other_game.id }

        expect(assigns(:achievement)).to eq achievement
      end

      it 'assigns the requested game to @game' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: other_game.id }

        expect(assigns(:achievement)).to eq achievement
      end

      it 'do not save a new game achievement in database' do
        expect { post :create, params: { player_id: player.id,
                                         id: achievement.id,
                                         game_id: other_game.id } }.to_not change(player.game_achievements, :count)
      end

      it 'returns message' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: other_game.id }

        expect(response_body['message']).to eq 'player not played in this game'
      end

      it 'returns 200 status' do
        post :create, params: { player_id: player.id,
                                id: achievement.id,
                                game_id: other_game.id }

        expect(response).to be_successful
      end
    end

    context 'invalid params' do
      before { post :create, params: { player_id: 1000,
                                       id: 1000,
                                       game_id: 1000 } }

      it 'returns error message' do
        expect(response_body['error']).to eq "Couldn't find Player with 'id'=1000"
      end

      it 'returns 404 status' do
        expect(response.status).to eq(404)
      end
    end
  end
end
