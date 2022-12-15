class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, :description, :price, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :duration_id,
             numericality: { other_than: 1 }

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :duration

end
