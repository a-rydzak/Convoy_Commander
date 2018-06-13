class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :invited_user
      t.string :permission_plan
      t.string :permission_vehicle

      t.timestamps null: false
    end
  end
end
