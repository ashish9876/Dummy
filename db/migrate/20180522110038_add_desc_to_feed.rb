class AddDescToFeed < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :desc, :string
  end
end
