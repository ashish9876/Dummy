class RenameTextToText < ActiveRecord::Migration[5.1]
  def change
  	 rename_column :feeds, :Text, :text
  end
end
