class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :contact, null: false, foreign_key: true
      t.datetime :timestamp
      t.string :ip
      t.string :sg_event_id

      t.timestamps
    end
  end
end
