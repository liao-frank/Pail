class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.integer :owner_id
      t.string :type
      t.float :goal
      t.float :raised
      t.date :start_date
      t.date :end_date
      t.string :description

      t.timestamps null: false
    end
  end
end
