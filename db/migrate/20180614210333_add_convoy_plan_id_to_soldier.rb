class AddConvoyPlanIdToSoldier < ActiveRecord::Migration
  def change
  	add_column :soldiers, :convoy_plan_id, :integer
  end
end
