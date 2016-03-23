class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :pw
      t.string :adminkey

      t.timestamps
    end
  end
end
