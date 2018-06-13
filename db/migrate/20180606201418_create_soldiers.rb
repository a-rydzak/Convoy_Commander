class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.string :name
      t.string :rank
      t.string :position
      t.references :vehicle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
