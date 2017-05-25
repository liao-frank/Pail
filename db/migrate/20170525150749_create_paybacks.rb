class CreatePaybacks < ActiveRecord::Migration
  def change
    create_table :paybacks do |t|
      t.integer :payment_id
      t.date :date

      t.timestamps null: false
    end
  end
end
