class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :organization_id
      t.integer :sender_id
      t.text :message_text
      t.integer :likes
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
