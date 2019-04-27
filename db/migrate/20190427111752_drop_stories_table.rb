class DropStoriesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :stories
  end
  def down
  end
end
