class Article < ActiveRecord::Base
  validates :title, :price, :stock, presence: true
end
