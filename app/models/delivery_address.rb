class DeliveryAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase_record
  belongs_to :prefecture
end
