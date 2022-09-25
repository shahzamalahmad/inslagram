class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :caption
      t.text :image_data

      t.timestamps
    end
  end
end
