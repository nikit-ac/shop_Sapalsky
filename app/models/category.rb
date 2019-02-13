class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  has_ancestry
  before_validation do
    self.ancestry = nil if self.ancestry.blank?
  end
end
