class RenameImageToImage < ActiveRecord::Migration[5.1]
  def change
  	rename_column :feeds, :Image, :image
  end
end
