class AddIndexSgEventIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :events, :sg_event_id, unique: true
  end
end
