class CreateTourneyresults < ActiveRecord::Migration
  def change
    create_table :tourneyresults do |t|
      t.integer :placing
      t.integer :points

      t.integer :tournament_id
      t.integer :playerrank_id
      t.timestamps
    end

    add_index :tourneyresults, :tournament_id
    add_index :tourneyresults, :playerrank_id
  end
end
