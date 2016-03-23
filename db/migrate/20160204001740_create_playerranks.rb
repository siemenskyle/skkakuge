class CreatePlayerranks < ActiveRecord::Migration
  def change
    create_table :playerranks do |t|
      t.integer :scaledpoints
      t.integer :totalpoints

      t.integer :game_id
      t.integer :player_id
      t.timestamps
    end

    add_index :playerranks, :game_id
    add_index :playerranks, :player_id
  end
end
