class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true, message: :include_hyphens }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true, message: :enter_in_single_byte_numbers_without_hyphens }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: :not_selected }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    delivery_address = DeliveryAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
                                              address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
