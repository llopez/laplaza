class AddDefaultsToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :price, :float, default: 0
    change_column :articles, :stock, :integer, default: 0
  end
end
