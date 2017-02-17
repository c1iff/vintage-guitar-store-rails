class AddProductsComments < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :price
      t.integer :owner_id

      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
