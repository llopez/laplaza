class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
