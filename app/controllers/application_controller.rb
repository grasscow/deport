class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart
  before_action :set_current_user
  private

  def set_cart #загружать корзину если она существует или создавать новую
    @cart=Cart.find(session[:cart_id])
    @cart_cnt = @cart.line_items.count #sum(:quantity) мы выводим именно количество наименований
  rescue ActiveRecord::RecordNotFound
    @cart=Cart.create
    session[:cart_id]= @cart.id
    @cart_cnt = 0
  end

  def set_current_user
    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    end
  end

  def require_login
    if !@current_user
      flash[:danger]='Требуется авторизация'
      redirect_to login_path
    end
  end

  def manager_permission
    unless @current_user.try(:manager?)
      flash[:danger]='Недостаточно прав'
      redirect_to login_path
    end
  end
  def manager_permission
    unless @current_user.try(:admin?)
      flash[:danger]='Недостаточно прав'
      redirect_to login_path
    end
  end
end
