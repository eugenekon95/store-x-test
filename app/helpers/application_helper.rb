module ApplicationHelper
  def comment_author?(user, comment)
    return false if user.nil?

    true if user.id == comment.user_id
  end

  def blank_stars(rating)
    5 - rating
  end

  def allowed_to_comment(product)
    allowed_products = []
    current_user.order_items.uniq(&:product_id).each do |order_product|
      allowed_products << order_product.product_id
    end
    allowed_products.include?(product.id)
  end
end
