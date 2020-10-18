class CreateGameAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :game_achievements do |t|
      t.references :game, :player, :achievement, foreign_key: true
      t.index %i[game_id player_id achievement_id], name: 'index_game_achievements_on_ids', unique: true

      t.timestamps
    end
  end
end
