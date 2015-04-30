class User < ActiveRecord::Base
  has_many :orders, dependent: :nullify
  ROLES=%w(Пользователь Менеджер Администратор)#0-пользоват,1-менеджер, 2 - Амин
  has_secure_password #валидация на то, что пароль должен существовать и парольнужно подтвердить
  validates :password, length: {minimum: 6}, if: "password.present?"
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format:{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i} #case_sensitive проверяет на уникальность не зависимо от регистра ,т.е. аа и Аа одинаковые
  validates :role, presence: true, inclusion: {in: 0...ROLES.size}
  before_validation :set_default_role
  def moderator?
    role==1 || admin?
  end
  def admin?
    role==2
    end
  private
  def set_default_role
    self.role ||= 0
  end
end
