module ApplicationHelper
  def min_price()
    Product.minimum(:price)
  end
  def max_price()
    Product.maximum(:price)
  end
end
