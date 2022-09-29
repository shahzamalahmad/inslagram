class CreateTableArticle < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :caption
      t.text :image_data
      t.text :title
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
