class Product < ApplicationRecord
  has_many :images
  has_many :orders
  accepts_nested_attributes_for :images, allow_destroy: true

  HIDDEN = 1
  ACTIVE = 2

  validates :title, :description, :price, :status, presence: true
  validates :status, inclusion: { in: [HIDDEN, ACTIVE]}

  def status_hash()
   {
      HIDDEN => 'Не показывать',
      ACTIVE => 'Активный'
    }
  end

end
