class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart
  private

  def set_cart #загружать корзину если она существует или создавать новую
    @cart=Cart.find(session[:cart_id])
    @cart_cnt = @cart.line_items.count #sum(:quantity) мы выводим именно количество наименований
  rescue ActiveRecord::RecordNotFound
    @cart=Cart.create
    session[:cart_id]= @cart.id
    @cart_cnt = 0
  end
end
