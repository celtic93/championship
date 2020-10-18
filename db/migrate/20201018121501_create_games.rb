class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :guest_team, foreign_key: { to_table: :teams }
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
