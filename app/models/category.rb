class Category < ActiveRecord::Base
  has_many :products
  validates :sort_num, presence: true, uniqueness: true
  #validates :product_id, uniqueness:
end
