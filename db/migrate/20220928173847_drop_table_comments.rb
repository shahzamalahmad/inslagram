class DropTableComments < ActiveRecord::Migration[7.0]
  def change
    drop_table :table_comments

  end
end
