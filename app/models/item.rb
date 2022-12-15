class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, :item_name, :description, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :duration_id,
             numericality: { other_than: 1 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :duration
  has_one_attached :image

end
