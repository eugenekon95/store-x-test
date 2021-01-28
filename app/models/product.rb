class Product < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :order_items, dependent: :destroy
  

  mount_uploader :image, ImageUploader
  validates_presence_of :name, :price, :category

  def to_param
    "#{id}-#{name}".parameterize
  end

  def average_rating
    return 0.0 if comments.persisted.empty?

    comments.persisted.sum(&:rating).to_f / comments.count
  end
end
