class Article < ActiveRecord::Base
  validates :title, :price, :stock, presence: true
  validates :price, numericality: true, if: "price.present?"
  validates :stock, numericality: true, if: "stock.present?"
end
