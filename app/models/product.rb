class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :orders
  accepts_nested_attributes_for :images, allow_destroy: true

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  HIDDEN = 1
  ACTIVE = 2

  validates :title, :description, :price, :status, presence: true
  validates :status, inclusion: { in: [HIDDEN, ACTIVE]}

  def self.statuses
    {'Не показывать' => self::HIDDEN , 'Активный' => self::ACTIVE}
  end
end
