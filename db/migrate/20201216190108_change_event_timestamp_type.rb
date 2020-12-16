class ChangeEventTimestampType < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :timestamp, :integer
  end
end
