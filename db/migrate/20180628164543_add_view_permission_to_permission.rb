class AddViewPermissionToPermission < ActiveRecord::Migration
  def change
  	add_column :permissions, :permission_view, :string
  end
end
