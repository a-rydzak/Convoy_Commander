class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :call_sign
      t.integer :serial_number
      t.integer :order_of_movement
      t.string :bumper_number
      t.references :convoy_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
