class AddPicUsersProducts < ActiveRecord::Migration[5.0]
  def up
    add_attachment :users, :avatar
    add_attachment :products, :picture
  end

  def down
    remove_attachment :users, :avatar
    remove_attachment :products, :picture
  end
end
