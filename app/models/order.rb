class Order < ActiveRecord::Base
  STATUSES = %w(Оформлен Подтвержден ДДоставляетя Завершен Оплачен)
  belongs_to :cart
  belongs_to :user
  validates :cart, presence: true
  validates :user, presence: true
  validates :address, presence: true
  validates :status, presence: true, inclusion: {in: 0..STATUSES.size}

  validate :check_cart
  scope :ordering, ->{order(created_at: :desc)}

  def check_cart
    if cart&&cart.line_items.blank?
      errors/add(:cart, 'пуста')
    end
  end
end
