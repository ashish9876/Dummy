class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :text
      t.string :image
      t.integer :permission

      t.timestamps
    end
  end
end
