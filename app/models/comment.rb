class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  after_initialize do
    self.rating ||= 0 if new_record?
  end

  scope :persisted, -> { where.not(id: nil) }

  validates_presence_of :body
  validates_uniqueness_of :user_id, scope: :product_id
end
