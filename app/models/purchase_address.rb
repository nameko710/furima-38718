class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    delivery_address = DeliveryAddress.create(post_code: post_code,prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)

  end

end
