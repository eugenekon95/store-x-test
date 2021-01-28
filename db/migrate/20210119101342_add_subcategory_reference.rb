class AddSubcategoryReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :parent
  end
end
