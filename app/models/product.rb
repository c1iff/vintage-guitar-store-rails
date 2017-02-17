class Product < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments

  has_attached_file :picture, styles: { full: '800x800>', thumb: '100x100#' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
