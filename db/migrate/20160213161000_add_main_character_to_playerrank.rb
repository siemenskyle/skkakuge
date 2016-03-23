class AddMainCharacterToPlayerrank < ActiveRecord::Migration
  def change
    add_column :playerranks, :mainchar, :string
  end
end
