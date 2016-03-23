class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :date

      t.integer :game_id
      t.timestamps
    end

    add_index :tournaments, :game_id
  end
end
