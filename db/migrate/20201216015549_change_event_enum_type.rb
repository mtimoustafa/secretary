class ChangeEventEnumType < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :event_type, :string, default: 'processed'
  end
end
