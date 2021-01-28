class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: %i[pending ordered canceled]
  after_initialize do
    self.status ||= :pending if new_record?
  end
end
