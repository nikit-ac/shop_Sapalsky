class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  has_ancestry
end
