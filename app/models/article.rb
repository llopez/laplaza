class Article < ActiveRecord::Base
  validates :title, :price, :stock, presence: true
  validates :price, :stock, numericality: true
end
