class StatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
    add_column :articles, :status, :string
  end
end
