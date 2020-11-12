class ChangeIdInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :id, :bigint
  end
end
