class ChangeSoldiersNameToSoldierName < ActiveRecord::Migration
  def change
  	rename_column :soldiers, :name, :soldier_name
  end
end
