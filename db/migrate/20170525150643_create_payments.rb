class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payee_id
      t.integer :payer_id
      t.integer :fundraiser_id
      t.float :amount
      t.string :message
      t.string :payment_receipt
      t.date :date

      t.timestamps null: false
    end
  end
end
