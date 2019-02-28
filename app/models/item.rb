class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  has_many :comments
  has_many :images
  has_many :categories_groups
  has_many :categories, through: :categories_groups
  has_many :brands
end
