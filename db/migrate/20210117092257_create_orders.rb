class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
