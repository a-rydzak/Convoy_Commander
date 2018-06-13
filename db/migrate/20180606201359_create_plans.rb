class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :situation
      t.text :mission
      t.text :execution
      t.text :service_support
      t.text :command_signal
      t.references :convoy_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
