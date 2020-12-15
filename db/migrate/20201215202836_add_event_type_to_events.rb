class AddEventTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_type, :integer, default: 0
  end
end
