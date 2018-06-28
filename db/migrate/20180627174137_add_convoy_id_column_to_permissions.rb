class AddConvoyIdColumnToPermissions < ActiveRecord::Migration
  def change
  	add_column :permissions, :convoy_plan_id, :integer
  end
end
