class DropBookmark < ActiveRecord::Migration[7.2]
  def change
    drop_table :bookmarks
  end
end
