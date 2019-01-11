module ApplicationHelper
  def min_price()
    Product.where(status: Product::ACTIVE).minimum(:price)
  end
  def max_price()
    Product.where(status: Product::ACTIVE).maximum(:price)
  end
end
