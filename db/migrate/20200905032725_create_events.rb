class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.references :repo, index: true, limit: 8
      t.references :actor, index: true, limit: 8
      t.string :created_at
    end
  end
end
