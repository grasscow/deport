class Product < ActiveRecord::Base
  has_many :line_items, dependent: :nullify #записи корзины если удалим продукт заменятся на null
  before_destroy :can_destroy?

  validates :price, presence: true, numericality: {greater_than: 0}
  validates :name, presence: true, length: {maximum: 200}
  validates :weight, numericality: {only_integer: true, greater_than: 0}, allow_blank: true
  def can_destroy?
    line_items.blank?
  end
end