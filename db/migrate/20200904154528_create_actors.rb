class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :login
      t.string :avatar_url
      t.integer :streak, default: 0
    end
  end
end
