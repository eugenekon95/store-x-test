class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :product

  after_initialize do
    self.quantity ||= 0 if new_record?
  end
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
