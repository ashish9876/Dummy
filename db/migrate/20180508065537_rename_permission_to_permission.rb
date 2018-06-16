class RenamePermissionToPermission < ActiveRecord::Migration[5.1]
  def change
  	  	rename_column :feeds, :Permission, :permission
  end
end
