class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :product

      t.timestamps
    end
  end
end
