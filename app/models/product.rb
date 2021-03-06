class Product < ApplicationRecord
  has_many :comments
  # has_many :users, through: :comments

  has_many :carts
  has_many :users, through: :carts

  has_attached_file :picture, styles: { full: '800x800>', thumb: '100x100#' }, default_url: "/images/:style/guitar.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def get_price
    return self.price.gsub(/[\s,]/ ,"").to_i
  end
end
