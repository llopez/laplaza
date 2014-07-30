class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :price, numericality: true, if: "price.present?"
  validates :stock, numericality: true, if: "stock.present?"
end
