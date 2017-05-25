class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|
      t.integer :org_id
      t.integer :user_id
      t.string :role
      t.string :title

      t.timestamps null: false
    end
  end
end
