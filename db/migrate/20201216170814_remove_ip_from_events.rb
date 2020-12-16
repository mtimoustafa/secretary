class RemoveIpFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :ip, :string
  end
end
