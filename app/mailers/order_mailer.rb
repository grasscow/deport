class OrderMailer < ApplicationMailer
  default from: "noreply@mail.msiu.ru"
  def info_email(order)
    @order = order
    mail(to: @order.user.email, subject: "заказ № #{order.id}")
  end
end
