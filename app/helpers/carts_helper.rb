module CartsHelper
  def show_cart(cart)
    text = "В корзине #{cart.total_line_items} товаро на сумму #{number_to_currency cart.total_amount}"
    content_tag(:div, class:"alert alet-info")
  end

end
